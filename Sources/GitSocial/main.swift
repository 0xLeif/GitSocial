import Foundation
import FoundationNetworking

var sema = DispatchSemaphore( value: 0)

func fetch(url: String) {
  print("FETCHING: \(url)")
  let request = URLRequest(url: URL(string: url)!)
  print("REQUEST: \(request)")
  let task = URLSession.shared.dataTask(with: request) { (data, response, error) in 
    print("RESPONSE: \(response)")
    guard let response = response as? HTTPURLResponse else {
      return
    }
    print("RESPONSE_HEADERS: \(response.allHeaderFields["Link"])")

    guard let data = data else {
      return
    }
    do {
      guard let jsonObjects = try? JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] else {
      sema.signal()
        return
      }
      //if let topics = jsonObjects["topics"] as? [String],
     // topics.contains("") {
        print("JSON_OBJECTS: \(jsonObjects)")
    //  }
    } catch {
      print("ERROR: \(error.localizedDescription)")
    }
    guard let next = response.allHeaderFields["Link"] as? String,
    let nextURL = next.split(separator: ";").first?.dropFirst().dropLast() else {
      sema.signal()
      return
    }

    print("NEXT: \(nextURL)")
    //fetch(url: String(nextURL))
  }
  task.resume()
}

fetch(url: "https://api.github.com/repositories")
sema.wait()
