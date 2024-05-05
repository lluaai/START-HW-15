import UIKit

func getData(urlRequest: String) {
    let urlRequest = URL(string: urlRequest)
    guard let url = urlRequest else {
        print("Некорректный URL: \(String(describing: urlRequest))")
        return
    }
    
    URLSession.shared.dataTask(with: url) { data, response, error in
        // Ошибка, если имеется
        if let error = error {
            print("Ошибка сетевого запроса: \(error.localizedDescription)")
            return
        }
        
        // Код ответа от сервера
        else if let response = response as? HTTPURLResponse, response.statusCode == 200 {
            print("Код ответа от сервера: \(response.statusCode)")
            
            guard let data = data else {
                print("Данные не получены.")
                return
            }
            // Данные, пришедшие с сервера
            if let dataAsString = String(data: data, encoding: .utf8) {
                print("Данные от сервера: \(dataAsString)")
            }
        }
    }.resume()
}

getData(urlRequest: "https://alexwohlbruck.github.io/cat-facts/")
