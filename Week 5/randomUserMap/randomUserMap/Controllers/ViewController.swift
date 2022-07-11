//
//  ViewController.swift
//  randomUserMap
//
//  Created by Consultant on 6/30/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var users = [User]()
    var page = 0
    var pageLimit = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        fetchUsers()
    }
    
    private func setup(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func fetchUsers(completed: ((Bool) -> Void)? = nil){
        var components = URLComponents(string: Constants.baseURL)!
        components.queryItems = [
            URLQueryItem(name: "page", value: "\(self.page)"),
            URLQueryItem(name: "results", value: "20")
        ]
        URLSession.shared.getRequest(components: components, decoding: APIRequest.self){
            results in
            switch results{
            case .success(let result):
                self.users.append(contentsOf: result.results)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print("Something went wrong: ", error)
            }
        }
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let listSection = TableSection(rawValue: section) else { return 0 }
        switch listSection {
        case .list:
            return users.count
        case .loader:
            return users.count >= self.pageLimit ? 1 : 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = TableSection(rawValue: indexPath.section) else { return UITableViewCell() }
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        switch section {
        case .list:
            cell.textLabel?.textColor = .label
            let user = users[indexPath.row]
            cell.textLabel?.text = "\((user.name["first"])!) \((user.name["last"])!)"
            cell.detailTextLabel?.text = "\(user.location.city) \(user.location.state)"
            cell.imageView?.getImage(from: URL(string: user.picture["thumbnail"]!)!)
        case .loader:
            cell.textLabel?.text = "Loading.."
            cell.textLabel?.textColor = .systemBlue
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailController = storyboard?.instantiateViewController(withIdentifier: "Details") as! DetailsViewController
        detailController.user = users[indexPath.row]
        
        navigationController?.show(detailController, sender: nil)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let section = TableSection(rawValue: indexPath.section) else { return }
        guard !users.isEmpty else { return }
        
        if section == .loader {
            print("load new data..")
            fetchUsers() { [weak self] success in
                if !success {
                    self?.hideBottomLoader()
                }
            }
           
        }
    }
    
    
    private func hideBottomLoader(){
        DispatchQueue.main.async {
            let lastListIndexPath = IndexPath(row: self.users.count - 1, section: TableSection.list.rawValue)
            self.tableView.scrollToRow(at: lastListIndexPath, at: .bottom, animated: true)
        }
    }
    
}

