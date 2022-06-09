//
//  ViewController.swift
//  Passing data
//
//  Created by Consultant on 6/8/22.
//

import UIKit

class ViewController: UIViewController, PassTextToMainController {

    static let notificationName = Notification.Name("navigate")
    @IBOutlet weak var viewLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewLabel.numberOfLines = 0
        NotificationCenter.default.addObserver(self, selector: #selector(onNotification(notification:)), name: ViewController.notificationName, object: nil)
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ThirdViewController{
            vc.delegate = self
            vc.data = "Data passed by main controller"
        }
        if let vc4 = segue.destination as? FourthViewController{
            vc4.completationHandler = { text in
                self.viewLabel.text = text
                return text.count
            }
        }
    }

    @IBAction func didButtonPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let destination = storyboard.instantiateViewController(withIdentifier: "Secondary") as! SecondViewController
        destination.data = "This is a text passed from the main controller"
        destination.mainController = self
        navigationController?.pushViewController(destination, animated: true)
    }
    
    @IBAction func didSegeButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "tertiarySegue", sender: nil)
    }
    
    func onDataPassed(data: String){
        viewLabel.text = data
    }
    
    func passDataFromDelegation(data: String) {
        viewLabel.text = data
    }
    
    @IBAction func didTapFouthViewButton(_ sender: Any) {
        performSegue(withIdentifier: "fourthSegue", sender: nil)
    }
    
    @objc func onNotification(notification:Notification){
        if let data = notification.userInfo?["data"] as? String {
            viewLabel.text = data
        }
    }
    
}

