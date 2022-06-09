//
//  GradientView.swift
//  musicList
//
//  Created by Consultant on 6/9/22.
//

import UIKit

@IBDesignable

class GradientTableView: UITableView{
    @IBInspectable var firstColor: UIColor = UIColor.clear {
        didSet{
            updateView()
        }
    }
    
    @IBInspectable var secondColor: UIColor = UIColor.clear {
        didSet{
            updateView()
        }
    }
    
    override class var layerClass: AnyClass {
       get {
          return CAGradientLayer.self
       }
    }

    
    func updateView(){
        let layer = self.layer as! CAGradientLayer
        
        layer.colors = [firstColor, secondColor].map{$0.cgColor}
        
    }
}
