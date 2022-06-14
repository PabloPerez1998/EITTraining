//
//  SFSmbolItem.swift
//  Collections
//
//  Created by Consultant on 6/10/22.
//

import UIKit

struct SFSymbolItem: Hashable {
    let name: String
    let image: UIImage
    
    init(name: String) {
        self.name = name
        self.image = UIImage(systemName: name)!
    }
}
