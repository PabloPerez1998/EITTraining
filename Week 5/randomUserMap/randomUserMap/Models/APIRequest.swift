//
//  APIRequest.swift
//  randomUserMap
//
//  Created by Consultant on 6/30/22.
//

import Foundation

struct APIRequest: Codable{
    let results: [User]
    let info: Info
}

struct Info: Codable{
    let results: Int
    let page: Int
}

struct User: Codable{
    let name: [String: String]
    let location: Location
    let email: String
    let picture: [String: String]
}

struct Location: Codable{
//    let street: String?
    let city: String
    let state: String
    let coordinates: [String: String]
}
