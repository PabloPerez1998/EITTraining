//
//  CarListVCViewController.swift
//  NoStoryBoard
//
//  Created by Consultant on 6/7/22.
//

import UIKit

class CarListVC: UIViewController {
    
    var tableView = UITableView()
    var cars:[Car] = []
    let carCell = "carCell"

    override func viewDidLoad() {
        view.backgroundColor = .green
        title = "Top exotic cars"
        configureTableView()
        setTableViewDelegates()
        cars = fetchData()
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func configureTableView(){
        view.addSubview(tableView)
        tableView.rowHeight = 100
        tableView.register(CarTableViewCell.self, forCellReuseIdentifier: carCell)
        tableView.pin(view)
    }
    
    func setTableViewDelegates(){
        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension CarListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: carCell, for: indexPath) as! CarTableViewCell
        let car = cars[indexPath.row]
        cell.set(car)
        
        return cell
    }
    
}

extension CarListVC{
    func fetchData() -> [Car] {
        let cars = [
            Car(image: Images.astonMartin, title: "AstonMartin DBS Superleggera"),
            Car(image: Images.bently, title: "Bentley Continental GT Convertible"),
            Car(image: Images.buggati, title: "Bugatti Chiron Super Sport 300"),
            Car(image: Images.ferrari, title: "ferrari SF90 Stradale"),
            Car(image: Images.lambo, title: "Lamborghini Aventador SVJ Roadster"),
            Car(image: Images.tesla, title: "Tesla-Roadster"),
            Car(image: Images.mercedes, title: "Mercedes AMGGT63S Four Door"),
            Car(image: Images.porsche, title: "Porsche Taycan Mission EConcept"),
            Car(image: Images.polestar, title: "Porsche Taycan Mission EConcept"),
            Car(image: Images.audi, title: "Audi RS6 Avant")
        ]
        return cars
    }
}
