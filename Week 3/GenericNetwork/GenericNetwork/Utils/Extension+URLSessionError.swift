//
//  Extension+URLSessionError.swift
//  GenericNetwork
//
//  Created by Consultant on 6/16/22.
//

import Foundation

extension URLSession{
    enum RequestError: Error{
        case badURL
        case badData
    }
}
