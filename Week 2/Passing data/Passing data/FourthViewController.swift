//
//  FourthViewController.swift
//  Passing data
//
//  Created by Consultant on 6/8/22.
//

import UIKit

class FourthViewController: UIViewController {
    
    var completationHandler: ((String) -> Int)?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTouchButton(_ sender: Any) {
        let result = completationHandler?("Data passed from fourth controller by Clousure")
        if result != nil{
            navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func didTouchNotificationButton(_ sender: Any) {
        NotificationCenter.default.post(name: ViewController.notificationName, object: nil, userInfo: ["data": "Data passed from fourth controller by Notification Center"])
        navigationController?.popViewController(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
