//
//  ViewController.swift
//  Label - HW
//
//  Created by Consultant on 6/6/22.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let center = self.view.center.x - 50
        let frame = CGRect(x: center, y: 100, width: 200, height: 21)
        let label = UILabel(frame: frame)
        applyLabelStyles(label: label)
        let date = Date()
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "MM/dd/yyyy"
        label.text = dateFormater.string(from: date)
        view.addSubview(label)
        
        //1.3
        var label1: UILabel, label2: UILabel
        //1.4
        let frame1 = CGRect(x:100, y: 130, width: 300, height: 21)
        let frame2 = CGRect(x:200, y: 130, width: 300, height: 21)
        label1 = UILabel(frame: frame1)
        label2 = UILabel(frame: frame2)
        label1.text = "Label 1"
        label2.text = "Label 2"
        view.addSubview(label1)
        view.addSubview(label2)
        
        //1.5
        var forHeight = 160.0
        for i in 0..<5{
            let forFrame = CGRect(x:center, y: forHeight, width: 200, height: 21)
            let forLabel = UILabel(frame: forFrame)
            forLabel.text = "Label in for \(i + 1)"
            view.addSubview(forLabel)
            forHeight += 20.0
        }
        
        //1.6
        
        
        
    }
    
    func applyLabelStyles(label: UILabel){
        label.backgroundColor = .clear
        label.textColor = .red
        label.font = UIFont(name: "Verdana", size: 18)
        label.numberOfLines = 2
        label.shadowColor = .lightGray
    }
    



}

