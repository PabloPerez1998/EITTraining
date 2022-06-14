//
//  DetailsViewController.swift
//  rick-and-morty
//
//  Created by Consultant on 6/14/22.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var originLabel: UILabel!
    @IBOutlet weak var episodesLabel: UILabel!
    
    var detailsInfo = Character(name: "", species: "", gender: "", origin: ["name" : ""], location: ["name" : ""], image: "", episodes: [""])

    override func viewDidLoad() {
        super.viewDidLoad()
        characterImageView.loadFrom(urlAddress: detailsInfo.image)
        nameLabel.text = detailsInfo.name
        speciesLabel.text = detailsInfo.species
        genderLabel.text = detailsInfo.gender
        locationLabel.text = detailsInfo.location?["name"]
        originLabel.text = detailsInfo.origin?["name"]
        episodesLabel.text = "Has appeard in \(String(detailsInfo.episodes.count)) episodes"
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
