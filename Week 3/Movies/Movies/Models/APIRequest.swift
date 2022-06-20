//
//  APIRequest.swift
//  Movies
//
//  Created by Consultant on 6/16/22.
//

import Foundation

struct MovieRequest: Codable{
    let page: Int
    let results: [Movie]
    let totalPages: Int
    
    enum CodingKeys: String, CodingKey{
        case page
        case results
        case totalPages = "total_pages"
    }
}
