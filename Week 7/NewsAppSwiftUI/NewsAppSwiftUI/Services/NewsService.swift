//
//  NewsService.swift
//  NewsAppSwiftUI
//
//  Created by Consultant on 7/14/22.
//

import Foundation
import Combine

protocol NewsService{
    func request(from endpoint: NewsAPI) -> AnyPublisher<[Article], APIError>
}

struct NewsServiceImp: NewsService{
    func request(from endpoint: NewsAPI) -> AnyPublisher<[Article], APIError> {
        return
            URLSession.shared.dataTaskPublisher(for: endpoint.urlRequest)
            .receive(on: DispatchQueue.main)
            .mapError{ _ in APIError.unknown }
            .flatMap{ data, response -> AnyPublisher<[Article], APIError> in
                guard let response = response as? HTTPURLResponse else {
                    return Fail(error: APIError.unknown).eraseToAnyPublisher()
                }
                if(200...299).contains(response.statusCode){
                    let jsonDecoder = JSONDecoder()
                    jsonDecoder.dateDecodingStrategy = .iso8601
                    
                    return Just(data)
                        .decode(type: [Article].self, decoder: jsonDecoder)
                        .mapError{_ in APIError.decodingError }
                        .eraseToAnyPublisher()
                            
                }else{
                    return Fail(error: APIError.errorCode(response.statusCode)).eraseToAnyPublisher()
                }
                
            }.eraseToAnyPublisher()
    }
    
    
}


