//
//  DetailsController.swift
//  Assigment-06-07-2022
//
//  Created by Consultant on 6/7/22.
//

import UIKit

class DetailsController: UIViewController {
    var grocery: String = ""
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var DetailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: grocery)
        DetailLabel.text = grocery
        // Do any additional setup after loading the view.
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
