//
//  ArtistDetailViewController.swift
//  musicList
//
//  Created by Consultant on 6/9/22.
//

import UIKit

class ArtistDetailViewController: UIViewController {

    @IBOutlet weak var bandImageView: UIImageView!
    @IBOutlet weak var bandNameLabel: UILabel!
    @IBOutlet weak var bandRecordLabel: UILabel!
    @IBOutlet weak var bandActiveYearsLabel: UILabel!
    @IBOutlet weak var bandBestSellingAlbumLabel: UILabel!
    @IBOutlet weak var bandGenereLabel: UILabel!
    @IBOutlet weak var bandFoundedInLabel: UILabel!
    @IBOutlet weak var bandMembersLabel: UILabel!
    
    var bandInfo: Artist = Artist(
        image: UIImage(named: "beatles")!,
        name: "",
        recordSells: "",
        activeYears: "",
        foundedIn: "",
        members: [""],
        genre: "",
        bestSellingAlbum: ""
    )
    override func viewDidLoad() {
        bandImageView.image = bandInfo.image
        bandNameLabel.text = bandInfo.name
        bandActiveYearsLabel.text = "Active: \(bandInfo.activeYears)"
        bandBestSellingAlbumLabel.text = "Best selling album: \(bandInfo.bestSellingAlbum)"
        bandRecordLabel.text = "Sales record: \(bandInfo.recordSells)"
        bandFoundedInLabel.text = "Founded in: \(bandInfo.foundedIn)"
        bandGenereLabel.text = "Genre: \(bandInfo.genre)"
        bandMembersLabel.text = "\(bandInfo.members.joined(separator: ", "))"
        super.viewDidLoad()
    }
    

}
