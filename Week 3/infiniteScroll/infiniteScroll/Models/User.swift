//
//  User.swift
//  infiniteScroll
//
//  Created by Consultant on 6/16/22.
//

import Foundation

struct User: Decodable{
    let id: Int
    let name: String
    let avatarUrl: String
    
    enum CodingKeys: String, CodingKey{
        case id
        case name = "login"
        case avatarUrl = "avatar_url"
    }
    
}
