//
//  ViewController.swift
//  Image-SW-HM
//
//  Created by Consultant on 6/6/22.
//

import UIKit

class ViewController: UIViewController {
    let imageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        imageView.frame = CGRect(x: 50, y: 50, width: 200, height: 200)
//        imageView.image = UIImage(named: "guppy.jpeg")
//
//        imageView.animationImages = [UIImage(named: "guppy.jpeg")!,
//                                     UIImage(named: "isaac.jpg")!,
//                                     UIImage(named: "angel.jpg")!]
//        imageView.animationDuration = 3
//        imageView.animationRepeatCount = 1
//
//        view.addSubview(imageView)
//        imageView.startAnimating()
        
        
        imageView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        imageView.image = UIImage(named: "guppy.jpeg")
        imageView.self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: revealingSplashView.centerXAnchor),
            imageView.widthAnchor.constraint(equalTo: revealingSplashView.widthAnchor, multiplier: 0.8),
            imageView.heightAnchor.constraint(equalToConstant: 25),
            imageView.bottomAnchor.constraint(equalTo: revealingSplashView.safeAreaLayoutGuide.bottomAnchor, constant: -32),
            ])
        imageView.addConstraint(<#T##constraint: NSLayoutConstraint##NSLayoutConstraint#> )
        
        
        [imageView addConstraint:[NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:100.0]];

        
    }


}

