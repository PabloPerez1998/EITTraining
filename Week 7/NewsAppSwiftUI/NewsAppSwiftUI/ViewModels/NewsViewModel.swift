//
//  NewsViewModel.swift
//  NewsAppSwiftUI
//
//  Created by Consultant on 7/14/22.
//

import Foundation
import Combine

protocol NewsViewModel{
    func getArticles()
}

class NewsViewModelImp: ObservableObject, NewsViewModel{
    private let service: NewsService
    private(set) var articles = [Article]()
    private var cancellables = Set<AnyCancellable>()
    
    @Published private(set) var state: ResultState = .loading
    
    init(service: NewsService){
        self.service = service
    }
    
    func getArticles() {
        self.state = .loading
        
        let cancellable = service.request(from: .getNews).sink{ result in
            switch result{
            case .finished:
                self.state = .success(content: self.articles)
            case .failure(let error):
                self.state = .error(error: error)
            }
        } receiveValue: { response in
            self.articles = response
        }
        self.cancellables.insert(cancellable)
    }
    
    
}

