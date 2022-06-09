//
//  UIView+Ext .swift
//  NoStoryBoard
//
//  Created by Consultant on 6/7/22.
//

import UIKit

extension UIView{
    //  Helper to setup Autolayout constraints programatically
    func pin(_ superView: UIView){
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
    }
}
