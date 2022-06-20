//
//  DetailViewController.swift
//  NYSchools
//
//  Created by Consultant on 6/15/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var neighborhoodLabel: UILabel!
    @IBOutlet weak var buildingCodeLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var faxLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var studentsLabel: UILabel!
    @IBOutlet weak var sportsLabel: UILabel!
    @IBOutlet weak var mathLabel: UILabel!
    @IBOutlet weak var readingLabel: UILabel!
    @IBOutlet weak var writingLabel: UILabel!
    var school: School?
    var grades: Grade?

    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = school?.name
        locationLabel.text = school?.location
        neighborhoodLabel.text = school?.neighborhood
        buildingCodeLabel.text = school?.buildingCode
        phoneLabel.text = school?.phoneNumber
        faxLabel.text = school?.faxNumber ?? "No info"
        emailLabel.text = school?.schoolEmail ?? "No info"
        websiteLabel.text = school?.website
        studentsLabel.text = school?.totalStudents
        sportsLabel.text = school?.schoolSports ?? "No info"
        mathLabel.text = grades?.mathAvgGrade ?? "No info"
        readingLabel.text = grades?.readingAvgGrade ?? "No info"
        writingLabel.text = grades?.writingAvgGrade ?? "No info"

    }
    

}
