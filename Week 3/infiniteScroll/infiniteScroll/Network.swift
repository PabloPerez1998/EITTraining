//
//  Network.swift
//  infiniteScroll
//
//  Created by Consultant on 6/16/22.
//

import Foundation

enum APIError: Error{
    case invalidUrl
    case errorDecode
    case failed(error: Error)
    case unknownError
}

struct Network{
    static let shared = Network()
    // Get all users from github
    /// https://docs.github.com/en/rest/reference/users#list-users
    /// - Parameters:
    ///   - perPage: Results per page (max 100). Default: 30
    ///   - sinceId: A user ID. Only return users with an ID greater than this ID. Default is nil
    func fetchUsers(perPage: Int = 30, sinceId: Int? = nil, completation: @escaping (Result<[User], APIError>) -> Void){
        var components = URLComponents(string: "https://docs.github.com/en/rest/reference/users#list-users")!
        components.queryItems = [
            URLQueryItem(name: "per_page", value: "\(perPage)"),
            URLQueryItem(name: "since", value: (sinceId != nil) ? "\(sinceId!)" : "")
        ]
        
        guard let url = components.url else{
            completation(.failure(.invalidUrl))
            return
        }
        let urlRequest = URLRequest(url: url, timeoutInterval: 10)
        URLSession.shared.dataTask(with: urlRequest){data, response, error  in
            if error != nil{
                print("dataTask error: \(error!.localizedDescription)")
            }
            
        }
    }
}



