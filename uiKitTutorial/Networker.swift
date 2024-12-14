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
    
    static let shared = Networker() // singleton
    
    private let session: URLSession
    
    init() {
        let config = URLSessionConfiguration.default
        session = URLSession(configuration: config)
    }
    
    func getQuote(completion: @escaping(Kanye?,Error?) -> (Void)) {
        let url = URL(string: "https://api.kanye.rest/")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = session.dataTask(with: url) {
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
    
    func getImage(completion: @escaping (Data?, Error?) -> Void){
        let url = URL(string: "https://pt.wikipedia.org/wiki/Ficheiro:Kanye_West_at_the_2009_Tribeca_Film_Festival_(crop_2).jpg")
        
        let task = session.downloadTask(with: url) {
            (localURL: URL?, response: URLResponse?, error: Error?) in
            
            if let error = error {
                DispatchQueue.main.async {
                    completion(nil,error)
                }
            }
        }
    }
    
}
