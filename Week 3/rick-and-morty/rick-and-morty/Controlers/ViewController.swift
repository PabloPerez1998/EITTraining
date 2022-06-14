//
//  ViewController.swift
//  rick-and-morty
//
//  Created by Consultant on 6/14/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    var ricks = [Character]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        fetchData()
               
    }
    
    func fetchData(){
        let url = "https://rickandmortyapi.com/api/character/?name=rick&status=alive"
        
        Network().fetchData(url: url){result in
            
            guard let parseData = result as? [String: Any] else {
                print("PARSE Error")
                return
            }
            
//            if(parseData["error"] != nil){
//                print("HAS Error: ", parseData["error"]!)
//                return
//            }
            
            guard let ricksArray = parseData["data"] as? [Any] else {
                print("Array convertion Error")
                return
                
            }
            
            for rick in ricksArray{
                guard let rickDict = rick as? [String: Any] else {
                        print("converting rick error")
                    return

                }
                guard let name = rickDict["name"] as? String else { return }
                guard let species = rickDict["species"] as? String else { return }
                guard let gender = rickDict["gender"] as? String else { return }
                let origin = rickDict["origin"] ?? ["name": "unknown", "url": ""]
                let location = rickDict["location"] ?? ["name": "unknown", "url": ""]
                guard let imageUrl = rickDict["image"] as? String else { return }
                guard let episodes = rickDict["episode"] as? [String] else { return }


                let newRick = Character(
                        name: name,
                        species: species,
                        gender: gender,
                        origin: origin as? [String : String],
                        location: location as? [String : String],
                        image: imageUrl,
                        episodes: episodes
                )

                self.ricks.append(newRick)

            }
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
            
        }
    }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ricks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollectionViewCell
        cell.characterImageView.loadFrom(urlAddress: ricks[indexPath.row].image)
        cell.characterNameLabel.text = ricks[indexPath.row].name
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "Details") as! DetailsViewController
        vc.detailsInfo = ricks[indexPath.row]
        navigationController?.show(vc, sender:nil)
    }
    
}

extension ViewController:  UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 150)
    }
}

