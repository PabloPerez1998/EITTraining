//
//  Network.swift
//  networking
//
//  Created by Consultant on 6/13/22.
//

import Foundation

protocol NetworkProtocol{
    func fetchData(url: String, options: [Any]?, completition: @escaping (Any?) -> Void )
    
    func postData(url: String, params: [Any], options: [Any]?, completition: @escaping (Any?) -> Void )
    
    func fetchOtherData(url: String, options: [Any]?, completition: @escaping (Any?) -> Void )
}

struct NetworkData:NetworkProtocol {
    
    func fetchData(url: String, options: [Any]?, completition: @escaping (Any?) -> Void) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
        else { return }
        let session = URLSession.shared
        let task =  session.dataTask(with: url){
            data, response, error in
            if let error = error {
                completition(["error": "Error: \(error.localizedDescription)", "data": nil])
            }else{
//                let jsonData = try?JSONSerialization.jsonObject(with: data!, options: [])
//                print("Response: \(String(describing: jsonData))")
                do{
                    let jsonData = try JSONSerialization.jsonObject(with: data!, options: [])
                    completition(["data": jsonData])
                }catch{
                    completition(["error": "Error: \(error)", "data": nil])
                }
            }
        }
        task.resume()
        
    }
    
    func postData(url: String, params: [Any], options: [Any]?, completition: @escaping (Any?) -> Void) {
        guard let url = URL(string: url)
        else { return }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONSerialization.data(withJSONObject: params, options:[])
        
        let session = URLSession.shared
        let task =  session.dataTask(with: url){
            data, response, error in
            if let error = error {
                completition(["error": "Error: \(error.localizedDescription)", "data": nil])
            }else{
                do{
                    let jsonData = try JSONSerialization.jsonObject(with: data!, options: [])
                    completition(["data": jsonData])
                }catch{
                    completition(["error": "Error: \(error)", "data": nil])
                }
            }
        }
        task.resume()
    }
    
    func fetchOtherData(url: String, options: [Any]?, completition: @escaping (Any?) -> Void) {
        let session = URLSession.shared
        guard let url = URL(string: url)
        else{
            return
        }
        let task = session.dataTask(with: url){
            data, response, error in
            if error != nil || response == nil {
                completition(["error": "Client error", "data": nil])
                return
            }
            guard let response = response as? HTTPURLResponse,(200...299).contains(response.statusCode)
            else {
                completition(["error": "Server error", "data": nil])
                return
            }
            do{
                let json  = try JSONSerialization.jsonObject(with: data!, options: [])
                completition(["data": json])
            }catch{
                completition(["error": "JSON ERROR \(error.localizedDescription)", "data": nil])
            }

        }
        task.resume()
    }
    
    
  
}
