//
//  NewsEndpoint.swift
//  NewsAppSwiftUI
//
//  Created by Consultant on 7/14/22.
//

import Foundation

protocol APIBuilder{
    var urlRequest: URLRequest { get }
    var baseURL: URL { get }
    var path: String { get }
}

enum NewsAPI {
    case getNews
    case getNewsCount
}

extension NewsAPI: APIBuilder{
    var urlRequest: URLRequest {
        return URLRequest(url: self.baseURL.appendingPathComponent(self.path))
    }
    
    var baseURL: URL {
        return URL(string: "https://api.spaceflightnewsapi.net/v3/")!
    }
    
    var path: String {
        return "articles"
    }
    
    
}
