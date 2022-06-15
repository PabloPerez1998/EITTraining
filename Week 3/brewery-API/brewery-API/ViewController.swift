//
//  ViewController.swift
//  brewery-API
//
//  Created by Consultant on 6/14/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var breweries = [Brewery]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegate()
        fetchData()
        // Do any additional setup after loading the view.
    }

    private func setupDelegate(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func fetchData(){
        let session = URLSession.shared
        guard let url = URL(string: "https://api.openbrewerydb.org/breweries")
        else {return}
        let task = session.dataTask(with: url){
            data, response, error in
            guard error == nil else{
                print("\(error?.localizedDescription ?? "No idea")")
                return
            }
            
            guard let responseData = data else{
                print("No data")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Not valid response")
                return
            }
//
            print("response status: \(httpResponse.statusCode)")
            print("response debug desc: \(httpResponse.debugDescription)")
            print("response localized desc: \(HTTPURLResponse.localizedString(forStatusCode: httpResponse.statusCode))")
            
            //parce results
            do{
                guard let jsonData = try?JSONSerialization.jsonObject(with: responseData, options: [])
                else{
                    return
                }
                
                guard let jsonArray = jsonData as? [Any] else {
                    print("converting error")
                    return
                    
                }
                for brewsky in jsonArray{
                    guard let breweryDict = brewsky as? [String: Any] else {
                            print("converting brewsky error")
                        return
                        
                    }
                    print(breweryDict)
                    guard let name = breweryDict["name"] as? String else { return }
                    guard let type = breweryDict["brewery_type"] as? String else { return }
                    guard let city = breweryDict["city"] as? String else { return }
                    guard let state = breweryDict["state"] as? String else { return }
//                    print(name)
//                    print(type)
//                    print(city)
//                    print(state)
                    print("============")
                    self.breweries.append(Brewery(name: name, type: type, city: city, state: state))
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        task.resume()
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return breweries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = breweries[indexPath.row].name
        cell.detailTextLabel?.text = "\(breweries[indexPath.row].city), \(breweries[indexPath.row].state)"
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "Details") as! DetailsViewController
        vc.details = breweries[indexPath.row]
        navigationController?.show(vc, sender:nil)
    }
    
}


