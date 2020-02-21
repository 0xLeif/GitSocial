import Foundation
/*
extension AnyPublisher {
  func value(_ closure: @escaping ((Output) -> Void)) -> AnyCancellable {
    sink(receiveCompletion: { _ in }, receiveValue: closure)
  }
}

func fetch() {
  // MARK: Requests
  var bag = [AnyCancellable]()

  let request = URLRequest(url: URL(string: "https://api.github.com/repositories")!)

  URLSession.shared.ocombine.dataTaskPublisher(for: request)
  .eraseToAnyPublisher()
  .value { (output) in
    print(output.response)

    do {
      let jsonObjects = try JSONSerialization.jsonObject(with: output.data, options: []) as? [Any]

      print(jsonObjects?.first)
    } catch {
      print(error.localizedDescription)
    }
  }
  .store(in: &bag)
}
  */
