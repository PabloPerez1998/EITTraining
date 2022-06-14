//
//  Network.swift
//  rick-and-morty
//
//  Created by Consultant on 6/14/22.
//

import Foundation

protocol NetworkProtocol{
    func fetchData(url: String, completation: @escaping (Any?) -> Void)
}

struct Network: NetworkProtocol{
    func fetchData(url: String, completation: @escaping (Any?) -> Void) {
        let session = URLSession.shared
        guard let url = URL(string: url)
        else {return}
        let task = session.dataTask(with: url){
            data, response, error in
            guard error == nil else{
                completation(["error": "\(error?.localizedDescription ?? "No idea")", "data": nil])
                return
            }
            
            guard let responseData = data else{
                completation(["error": "No data", "data": nil])
                return
            }
            
            guard let _ = response as? HTTPURLResponse else {
                completation(["error": "Not valid response", "data": nil])
                return
            }
            
            do{
                guard let jsonDecoded = try?JSONSerialization.jsonObject(with: responseData, options: []) else {return}
                
                guard let responseProperties = jsonDecoded as? [String: Any] else {
                    completation(["error": "Convertion error", "data": nil])
                    return
                    
                }
                guard let parsedData = responseProperties["results"] as? [Any] else {
                    completation(["error": "Convertion error", "data": nil])
                    return
                    
                }
                
                completation(["error": nil, "data": parsedData])
            }
        }
        task.resume()
    }

//    public enum Result<Success, Failure:Error>{
//        case success(Success)
//
//        case failure(Failure)
//    }
//
//    enum ErrorHandler<error, data, response>{
//        case error != nil
//    }
    
}
