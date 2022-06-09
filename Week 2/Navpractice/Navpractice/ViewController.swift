//
//  ViewController.swift
//  Navpractice
//
//  Created by Consultant on 6/6/22.
//

import UIKit

class ViewController: UIViewController {
    
    var greenSegue = "greenSegue"

    @IBOutlet weak var dateLabelView: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("view will appear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("view did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("view will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("view did disappear")
    }
    
    @IBAction func touchedButton(_ sender: Any) {
        performSegue(withIdentifier: greenSegue, sender: nil)
    }
}

