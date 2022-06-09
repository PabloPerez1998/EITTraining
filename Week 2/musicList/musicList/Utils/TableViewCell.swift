//
//  TableViewCell.swift
//  musicList
//
//  Created by Consultant on 6/9/22.
//

import UIKit

class TableViewCell: UITableViewCell{
    var bandImageView = UIImageView()
    let labelsStackView = UIStackView()
    var bandName = UILabel()
    var bandActiveYears = UILabel()
    var bandGenre = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(bandImageView)
        addSubview(labelsStackView)
        configureImageView()
        setImageConstraints()
        configureStackView()
        setMainStackViewLabelConstraints()
        configureLabel(label: bandName)
        configureLabel(label: bandActiveYears)
        labelsStackView.addArrangedSubview(bandName)
        labelsStackView.addArrangedSubview(bandActiveYears)
    }
    
    required init?(coder: NSCoder){
        fatalError("init (coder:) has not been implemented")
    }
    
    func set(_ band: Artist){
        bandImageView.image = band.image
        bandName.text = band.name
        bandActiveYears.text = band.activeYears
        bandGenre.text = band.genre
    }
    
    func configureLabel(label: UILabel){
        label.textColor = .white
    }
    
    func configureStackView(){
        labelsStackView.axis = .vertical
        labelsStackView.distribution = .fillEqually
        labelsStackView.alignment = .fill
        labelsStackView.spacing = 5
        labelsStackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configureImageView(){
        bandImageView.clipsToBounds = true
    }
    func configureTitleLabel(){
        bandName.numberOfLines = 0
        bandName.adjustsFontSizeToFitWidth = true
    }
    func configureactiveYearsLabel(){
        bandActiveYears.numberOfLines = 0
        bandActiveYears.adjustsFontSizeToFitWidth = true
    }
    func setImageConstraints(){
        bandImageView.translatesAutoresizingMaskIntoConstraints = false
        bandImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        bandImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        bandImageView.widthAnchor.constraint(equalTo: bandImageView.heightAnchor, multiplier: 16/9).isActive = true
        bandImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    func setMainStackViewLabelConstraints(){
        labelsStackView.translatesAutoresizingMaskIntoConstraints = false
        labelsStackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        labelsStackView.leadingAnchor.constraint(equalTo: bandImageView.trailingAnchor, constant: 20).isActive = true
        labelsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant:  -12).isActive = true
    }
}
