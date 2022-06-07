//
//  ViewController.swift
//  Assigment-06-07-2022
//
//  Created by Consultant on 6/7/22.
//

import UIKit


class ViewController: UIViewController {
    let vc = TableViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func didTouchButton(_ sender: Any) {
        vc.grocerylist = ["apples", "papaya", "tomatoes", "carrots"]
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

