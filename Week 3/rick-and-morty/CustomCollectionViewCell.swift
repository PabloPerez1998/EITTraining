//
//  CustomCollectionViewCell.swift
//  rick-and-morty
//
//  Created by Consultant on 6/14/22.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var characterNameLabel: UILabel!
}

extension UIImageView{
    func loadFrom(urlAddress: String){
        guard let url = URL(string: urlAddress) else { return }
        
        DispatchQueue.main.async { [weak self] in
            if let imageData = try?Data(contentsOf: url){
                if let loadedImage = UIImage(data: imageData){
                    self?.image = loadedImage
                }
            }
                
        }
    }
}
