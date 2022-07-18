//
//  ArticleView.swift
//  NewsAppSwiftUI
//
//  Created by Consultant on 7/14/22.
//

import SwiftUI
import UIKit
import URLImage

struct ArticleView: View {
    let article: Article
    
    var body: some View {
        HStack{
            if let image = article.imageUrl, let url = URL(string: image){
                URLImage(url, identifier: String(article.id),
                    failure: { error, retry in
                        PlaceHolderImageView()
                }, content: { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                })
                .frame(width: 100, height: 100)
                .cornerRadius(10)
            }else{
                PlaceHolderImageView()
            }
            VStack(alignment: .leading, spacing: 4){
                Text(article.title ?? "")
                    .foregroundColor(.black)
                    .font(.system(size: 18, weight: .semibold))
                Text(article.summary ?? "")
                    .foregroundColor(.black)
                    .font(.system(size: 12, weight: .regular))
            }
        }
    }
}

struct PlaceHolderImageView: View{
    var body: some View {
        Image(systemName: "photo.fill")
            .foregroundColor(.white)
            .background(.gray)
            .frame(width: 100, height: 100)
            .cornerRadius(10)
        
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(article: Article.dummyData)
            .previewLayout(.sizeThatFits)
    }
}
