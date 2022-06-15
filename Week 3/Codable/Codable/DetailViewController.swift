//
//  DetailViewController.swift
//  Codable
//
//  Created by Consultant on 6/15/22.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var attributesLabel: UILabel!
    @IBOutlet weak var attackLabel: UILabel!
    @IBOutlet weak var legsLabel: UILabel!
    
    var hero: Hero?
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = hero?.name
        attackLabel.text = hero?.attackType
        attributesLabel.text = hero?.primaryAtribute
        legsLabel.text = "\((hero?.legs)!)"
        
        let baseUrl = "https://api.opendota.com/" + hero?.image
        let url = 
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
