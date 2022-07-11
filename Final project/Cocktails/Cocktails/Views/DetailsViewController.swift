//
//  DetailsViewController.swift
//  Cocktails
//
//  Created by Consultant on 7/8/22.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var cocktailImageView: UIImageView!
    @IBOutlet weak var cocktailNameLabel: UILabel!
    @IBOutlet weak var cocktailTagsLabel: UILabel!
    @IBOutlet weak var cocktailAlcoholLabel: UILabel!
    @IBOutlet weak var cocktailCategoryLabel: UILabel!
    @IBOutlet weak var ingredientsTableView: UITableView!
    @IBOutlet weak var instructionsTextView: UITextView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var detailsView: UIView!
    @IBOutlet weak var favoriteButton: UIButton!
    
    let viewModel = DetailsViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        initViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.inicializeFavorites()
    }
    
    func setup(){
        ingredientsTableView.delegate = self
        ingredientsTableView.dataSource = self
    }
    
    func initViewModel(){
        viewModel.showInfo = {
            DispatchQueue.main.async {
                self.inicializeUIValues()
                self.cocktailImageView.isHidden = false
                self.cocktailNameLabel.isHidden = false
                self.cocktailTagsLabel.isHidden = false
                self.cocktailAlcoholLabel.isHidden = false
                self.cocktailCategoryLabel.isHidden = false
                self.ingredientsTableView.isHidden = false
                self.instructionsTextView.isHidden = false
                self.ingredientsTableView.reloadData()
            }
        }
        viewModel.showError = { error in
            DispatchQueue.main.async { self.showAlert(error, title: "Ups, something went wrong.") }
        }
        viewModel.showLoading = {
            DispatchQueue.main.async{
                self.activityIndicator.startAnimating()
                self.cocktailImageView.isHidden = true
                self.cocktailNameLabel.isHidden = true
                self.cocktailTagsLabel.isHidden = true
                self.cocktailAlcoholLabel.isHidden = true
                self.cocktailCategoryLabel.isHidden = true
                self.ingredientsTableView.isHidden = true
                self.instructionsTextView.isHidden = true
            }
        }
        viewModel.hideLoading = {
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
                self.activityIndicator.isHidden = true
            }
        }
        
        viewModel.setButtonColor = { value in
            DispatchQueue.main.async {
                var color:UIColor = .darkGray
                if(value == "favorited"){
                    color = .systemPink
                }
                self.changeFavButtonColor(color: color)
            }
        }
    }
    
    func configure(_ cocktail: Cocktail? = nil){
        if let cocktailDetails = cocktail {
            viewModel.getDetailsById(id: cocktailDetails.id)
        }else {
            viewModel.getRandomCocktai()
        }
    }
    
    
    func inicializeUIValues(){
        let cocktail = viewModel.getCocktail()
        cocktailImageView.getImage(from: URL(string: cocktail.thumbUrl)!)
        cocktailNameLabel.text = cocktail.name
        cocktailTagsLabel.text = cocktail.tags
        cocktailAlcoholLabel.text = cocktail.alcoholic
        cocktailCategoryLabel.text = cocktail.category
        instructionsTextView.text = cocktail.instructions
        var color: UIColor = .darkGray
        if(viewModel.checkIfFavorite()){
            color = .systemPink
        }
        changeFavButtonColor(color: color)
        
    }
    
    func changeFavButtonColor(color: UIColor){
        favoriteButton.tintColor = color
    }
    
    @IBAction func didTapFavotiresButton(_ sender: Any) {
        print("click")
        viewModel.setFavorite()
    }
    
}

extension DetailsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfCells
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.ingredientsTableView.dequeueReusableCell(withIdentifier: "ingredientCell", for: indexPath)
        let ingredient = viewModel.getCocktail().ingredients[indexPath.row]
        cell.textLabel?.text = ingredient.ingredient
        cell.detailTextLabel?.text = ingredient.measure
        return cell
    }
    
    
}
