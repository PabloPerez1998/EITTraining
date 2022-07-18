//
//  APIError.swift
//  NewsAppSwiftUI
//
//  Created by Consultant on 7/14/22.
//

import Foundation
//import SwiftUI

enum APIError: Error{
    case decodingError
    case errorCode(Int)
    case unknown
    case error(String)
}

extension APIError: LocalizedError{
    var errorDescription: String?{
        switch self {
        case .decodingError:
            return ErrorConstants.decodingError
        case .errorCode(let code):
            return "\(code) \(ErrorConstants.errorCode)"
        case .error(let error):
            return "\(ErrorConstants.error) \(error)"
        case .unknown:
            return ErrorConstants.unknown
        }
    }
}


