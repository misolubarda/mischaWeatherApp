//

import Foundation

class CurrentWeatherViewModel: ObservableObject {
    @Published var temperatureString: String = "Fetching..."
    @Published var humidityString: String = ""
    @Published var cloudinessString: String = ""
    @Published var searchText: String = ""

    var myName: String = "Miso"

    func onAppear() {
        refresh()
    }

    func buttonTapped() {
        refresh()
    }

    private func refresh() {
        guard let url = URL(string: "https://weatherapi-com.p.rapidapi.com/current.json?q=46.47,30.73") else {
            return
        }

        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = [
            "X-RapidAPI-Key": "41396f4bcdmshc36cebaf2f2eb47p12006fjsnb058c9169e4b",
            "X-RapidAPI-Host": "weatherapi-com.p.rapidapi.com"
        ]


        let task = URLSession.shared.dataTask(with: request, completionHandler: { data, _, _ in
            guard let data = data else {
                return
            }

            do {
                let responseDTO = try JSONDecoder().decode(ResponseDTO.self, from: data)

                DispatchQueue.main.async {
                    self.temperatureString = "\(responseDTO.current.temp_c)"
                    self.cloudinessString = "\(responseDTO.current.cloud)"
                    self.humidityString = "\(responseDTO.current.humidity)"
                }
            } catch let error {
                print(error)
            }
        })

        task.resume()
    }
}

// MARK: Error
private enum MyError: Error {
    case parsingError
}

// MARK: DTOs
private struct ResponseDTO: Decodable {
    let current: CurrentDTO
}

private struct CurrentDTO: Decodable {
    let temp_c: Double
    let humidity: Int
    let cloud: Int
}
