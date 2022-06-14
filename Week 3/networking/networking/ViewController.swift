//
//  ViewController.swift
//  networking
//
//  Created by Consultant on 6/13/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        fetchData()
        post()
//        fetchOtherData()
        
        
        
    }
    
    func fetchData(){
        let _ = NetworkData().fetchData(url: "https://jsonplaceholder.typicode.com/posts", options: []){
            result in
            print(result!)
        }
    }
    
    func post(){
        let params = [
            "title", "Week 2.5 day 1",
            "body", "Making network requests using URLSession"
        ]
       let url = "https://jsonplaceholder.typicode.com/posts"
        let _ = NetworkData().postData(url: url, params: params, options: []){
            result in
            print(result!)
            DispatchQueue.main.async {
                self.view.backgroundColor = .cyan
            }
        }
    }
    
    func fetchOtherData(){
        let url = "https://gist.githubusercontent.com/reinder42/932d7671859959f6363b4d9b4e18bb91/raw/306631d79a5166bb0d86b12ac7d8cc42fecb996e/users.json"
        let _ = NetworkData().fetchOtherData(url: url, options: []){
            result in
            print(result!)
        }
    }


}

