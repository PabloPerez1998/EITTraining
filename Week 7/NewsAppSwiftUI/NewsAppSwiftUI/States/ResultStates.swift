//
//  ResultStates.swift
//  NewsAppSwiftUI
//
//  Created by Consultant on 7/14/22.
//

import Foundation

enum ResultState{
    case loading
    case success(content: [Article])
    case error(error: Error)
}
