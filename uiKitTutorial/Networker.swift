//
//  Networker.swift
//  uiKitTutorial
//
//  Created by Davi Paiva on 11/12/24.
//

import Foundation

enum NetworkerError: Error{
    case badResponse
    case badStatusCode(Int)
    case badData
}
class Networker {
    func getQuote(completion: @escaping(Kanye?,Error?) -> (Void)) {
        let url = URL(string: "https://api.kanye.rest/")!
        
        let task = URLSession.shared.dataTask(with: url) {
            // task completed with error or not
            (data: Data?, response: URLResponse?,error: Error?) in
            if let error = error {
                completion(nil,error)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(nil, NetworkerError.badResponse)
                return
            }
            
            guard(200...299).contains(httpResponse.statusCode) else {
                completion(nil,NetworkerError.badStatusCode(httpResponse.statusCode))
                return
            }
            
            guard let data = data else{
                completion(nil, NetworkerError.badData)
                return
            }
            do {
                let kanye = try JSONDecoder().decode(Kanye.self, from: data)
                DispatchQueue.main.async{
                    completion(kanye,nil)
                }
                
            } catch let error {
                print("Error", error)
            }
        }
        task.resume()
    }
}
