//
//  Brewery.swift
//  brewery-API
//
//  Created by Consultant on 6/14/22.
//

import Foundation

class Brewery{
    var name: String
    var type: String
    var city: String
    var state: String
    
    init(name: String, type: String, city: String, state: String){
        self.name = name
        self.type = type
        self.city = city
        self.state = state
    }
}
