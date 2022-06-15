//
//  Extension+UIImageView.swift
//  Codable
//
//  Created by Consultant on 6/15/22.
//

import Foundation
import UIKit


extension UIImageView{
    func getImage(from url:String, contentMode mode: ContentMode = .scaleAspectFit){
        contentMode = mode
        let session = URLSession.shared
        let task = session.dataTask(with: url){data, response, error in
            guard let httpURLResponse = response as HTTPURLResponse,
                  httpURLResponse.code == 200 else {return}
            
            guard let mimeType = response?.mimeType 
                    
        }
    }
}
