//
//  HomeView.swift
//  NewsAppSwiftUI
//
//  Created by Consultant on 7/14/22.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = NewsViewModelImp(service: NewsServiceImp())
    
    var body: some View {
        Group{
            switch viewModel.state{
            case .loading:
                ProgressView()
            case .error(let error):
                ErrorView(error: error, handler: viewModel.getArticles)
            case .success(let articles):
                NavigationView{
                    List(articles) { item in
                        ArticleView(article: item)
                    }.navigationTitle(Text("News"))
                }
            }
        }.onAppear(perform: viewModel.getArticles)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
