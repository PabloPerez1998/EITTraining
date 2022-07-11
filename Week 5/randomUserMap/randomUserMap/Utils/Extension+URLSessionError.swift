//
//  Extension+URLSessionError.swift
//  randomUserMap
//
//  Created by Consultant on 6/30/22.
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

