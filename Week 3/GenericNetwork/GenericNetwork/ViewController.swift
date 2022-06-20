//
//  ViewController.swift
//  GenericNetwork
//
//  Created by Consultant on 6/16/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var users = [User]()
    var posts = [Post]()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDelegate()
//        fetchUser()
        fetchPost()
        
    }
    
    func setUpDelegate(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func fetchUser(){
        URLSession.shared.getRequest(url: APIEndpoints.users, decoding: [User].self){
            [weak self] result in
            switch result{
            case .success(let user):
                self?.users = user
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
            
        }
    }
    
    func fetchPost(){
        URLSession.shared.getRequest(url: APIEndpoints.posts, decoding: [Post].self){
            [weak self] result in
            switch result{
            case .success(let post):
                self?.posts = post
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
            
        }
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return users.count
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.textLabel?.text = users[indexPath.row].name.capitalized
//        cell.detailTextLabel?.text = users[indexPath.row].email
         cell.textLabel?.text = posts[indexPath.row].title.capitalized
        cell.detailTextLabel?.text = posts[indexPath.row].body
        return cell
    }
    
    
}

