//
//  ViewController.swift
//  Stacked Labels - SW - HW
//
//  Created by Consultant on 6/6/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ClickLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(labelClicked(_:)))
        ClickLabel.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }
    
    @objc func labelClicked(_ sender: Any) {
         print("UILabel clicked")
     }


}

