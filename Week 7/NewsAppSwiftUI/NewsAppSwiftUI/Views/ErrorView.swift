//
//  ErrorView.swift
//  NewsAppSwiftUI
//
//  Created by Consultant on 7/14/22.
//

import SwiftUI

struct ErrorView: View {
    typealias ErrorViewActionHandler = () -> Void
    let error: Error
    let handler:ErrorViewActionHandler
    let errorImage = "exclamationmark.icloud.fill"
    
    internal init(error: Error, handler: @escaping ErrorView.ErrorViewActionHandler){
        self.error = error
        self.handler = handler
    }
    
    var body: some View {
        VStack{
            Image(systemName: errorImage)
                .foregroundColor(.gray)
                .font(.system(size: 50, weight: .heavy))
                .padding(.bottom, 3)
            Text("Oh no!")
                .foregroundColor(.black)
                .font(.system(size: 30))
            Text(error.localizedDescription)
                .foregroundColor(.gray)
                .font(.system(size: 15))
                .multilineTextAlignment(.center)
                .padding(.vertical, 3)
            Button(action: {
                handler()
            }, label: {
                Text("Retry")
            })
            .padding(.vertical, 12)
            .padding(.horizontal, 30)
            .background(.blue)
            .foregroundColor(.white)
            .font(.system(size: 16, weight: .heavy))
            .cornerRadius(10)
            
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(error: APIError.decodingError){}
            .previewLayout(.sizeThatFits)
    }
}
