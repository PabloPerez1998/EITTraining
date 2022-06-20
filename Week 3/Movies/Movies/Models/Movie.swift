//
//  Movie.swift
//  Movies
//
//  Created by Consultant on 6/16/22.
//

import Foundation

struct Movie: Codable{
    let id: Int
    let title: String
    let popularity: Float?
    let originalLanguage: String?
    let releaseDate: String?
//    let voteAverage: Int?
//    let voteCount: Int?
    
    enum CodingKeys: String, CodingKey{
        case id
        case title
        case popularity
        case originalLanguage = "original_language"
        case releaseDate = "release_date"
//        case voteAverage = "vote_average"
//        case voteCount = "vote_count"
    }
}
