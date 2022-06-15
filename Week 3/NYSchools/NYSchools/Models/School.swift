//
//  School.swift
//  NYSchools
//
//  Created by Consultant on 6/15/22.
//

import Foundation

struct School: Codable {
    let dbn: String
    let name: String
    let neighborhood: String
    let location: String
    let buildingCode: String?
    let phoneNumber: String
    let faxNumber: String?
    let schoolEmail: String?
    let website: String
    let totalStudents: String
    let schoolSports: String?
    
    
    enum CodingKeys: String, CodingKey {
        case dbn = "dbn"
        case name = "school_name"
        case neighborhood = "neighborhood"
        case location = "location"
        case buildingCode = "building_code"
        case phoneNumber = "phone_number"
        case faxNumber = "fax_number"
        case schoolEmail = "school_email"
        case website = "website"
        case totalStudents = "total_students"
        case schoolSports = "school_sports"
    }
    
}

