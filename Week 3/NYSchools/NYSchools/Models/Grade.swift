//
//  Grades.swift
//  NYSchools
//
//  Created by Consultant on 6/15/22.
//

import Foundation

struct Grade: Codable {
    let mathAvgGrade: String?
    let readingAvgGrade: String?
    let writingAvgGrade: String?
    
    
    enum CodingKeys: String, CodingKey {
        case mathAvgGrade = "sat_math_avg_score"
        case readingAvgGrade = "sat_critical_reading_avg_score"
        case writingAvgGrade = "sat_writing_avg_score"
    }
    
}
