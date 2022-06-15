//
//  Hero.swift
//  Codable
//
//  Created by Consultant on 6/15/22.
//

import Foundation

struct Hero: Codable{
    let name:String
    let primaryAtribute: String
    let attackType: String
    let legs: Int
    let image: String
    
    enum CodingKeys: String, CodingKey{
        case name = "localizaded_name"
        case primaryAtribute = "primary_attr"
        case attackType = "attack_type"
        case legs = "legs"
        case image = "img"
    }
}
