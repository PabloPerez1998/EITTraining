//
//  SecondViewController.swift
//  Passing data
//
//  Created by Consultant on 6/8/22.
//

import UIKit

class SecondViewController: UIViewController {
    var mainController:ViewController?
    @IBOutlet weak var viewLabel: UILabel!
    var data:String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        viewLabel.text = data
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didPressedButton(_ sender: Any) {
        mainController?.onDataPassed(data: "This is a message from the secondary controller: Using function method!(Not recomended)")
        navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
