//
//  PokemonTableViewCell.swift
//  Pokemon
//
//  Created by Consultant on 6/17/22.
//

import UIKit

class PokemonTableViewCell: UITableViewCell {

    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typesLabel: UILabel!
    
    var pokemon: Pokemon?
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        nameLabel.text = pokemon?.name
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
