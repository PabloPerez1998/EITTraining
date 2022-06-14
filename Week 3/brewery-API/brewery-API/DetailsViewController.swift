//
//  DetailsViewController.swift
//  brewery-API
//
//  Created by Consultant on 6/14/22.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    
    var details = Brewery(
        name: "",
        type:"",
        city:"",
        state:""
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = details.name
        typeLabel.text = details.type
        cityLabel.text = details.city
        stateLabel.text = details.state
        
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
