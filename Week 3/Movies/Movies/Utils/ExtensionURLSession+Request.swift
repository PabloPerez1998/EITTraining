//
//  ExtensionURLSession+Request.swift
//  Movies
//
//  Created by Consultant on 6/16/22.
//

import Foundation

extension URLSession{
    
    func getRequest<T: Codable>(page: Int, components: URLComponents?, decoding: T.Type, completion: @escaping(Result<T, Error>) -> ()){
        
        var newComponents = components
        newComponents?.queryItems?.append(contentsOf: [
            URLQueryItem(name: "page", value: "\(page)"),
            URLQueryItem(name: "api_key", value: APIEndpoints.apiKey)
        ])
        
        guard let url = newComponents?.url else {
                completion(.failure(RequestError.invalidUrl))
                return
        }
        let urlRequest = URLRequest(url: url, timeoutInterval: 10)
        URLSession.shared.dataTask(with: urlRequest){ data, response, error in
            if let error = error {
                completion(.failure(RequestError.failed(error: error)))
            }
            
            guard data != nil else{
                completion(.failure(RequestError.unknownError))
                return
            }
            
            do{
                let jsonResult = try JSONDecoder().decode(decoding, from: data!)
                completion(.success(jsonResult))
            }catch{
                completion(.failure(RequestError.errorDecode))
            }
        }.resume()
    }
}
