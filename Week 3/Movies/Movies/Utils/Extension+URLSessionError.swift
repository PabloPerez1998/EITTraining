//
//  Extension+URLSessionError.swift
//  Movies
//
//  Created by Consultant on 6/16/22.
//

import Foundation

extension URLSession{
    enum RequestError:Error{
        case invalidUrl
        case errorDecode
        case failed(error: Error)
        case unknownError
    }
}
