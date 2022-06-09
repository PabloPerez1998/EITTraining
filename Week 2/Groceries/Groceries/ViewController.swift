//
//  ViewController.swift
//  Groceries
//
//  Created by Consultant on 6/7/22.
//

import UIKit



class ViewController: UIViewController, DataEnteredDelegate {
    
    @IBOutlet weak var displayLabel: UILabel!
    let vc = TableViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "My viewController"
        vc.delegate = self
        // Do any additional setup after loading the view.
    }
    

    @IBAction func didTapButton(_ sender: Any) {
        vc.grocerylist = ["apples", "papaya", "tomatoes", "carrots", "eggs", "bread", "cheese", "milk", "coffe"]
        
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func userDidEnterInformation(info: String) {
        displayLabel.text = info
    }
    
}

