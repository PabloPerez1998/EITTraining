//
//  ViewController.swift
//  PersistanceInt
//
//  Created by Consultant on 6/20/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var switchView: UISwitch!
    @IBOutlet weak var intLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var userLabel: UILabel!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        let isOn = UserDefaults.standard.bool(forKey: "switchIsOn")
        var _ = UserDefaults.standard.integer(forKey: "number")
        var _ = UserDefaults.standard.string(forKey: "string")
        updateUI(isOn: isOn)
        var user = User(firstName: "Loki", lastName: "Laufyson")
        user = UserDefaultsManager.shared.signedInUser
//        userLabel.text = "\(user.firstName) \(user.lastName)"
        UserDefaults.standard.signedInUser = user
        print("The signed in user is: \(String(describing: UserDefaults.standard.signedInUser))")
        // Do any additional setup after loading the view.
    }

    @IBAction func switchToggled(_ sender: UISwitch) {
        updateUI(isOn: sender.isOn)
        UserDefaults.standard.switchIsOn = sender.isOn
//        UserDefaults.standard.set(sender.isOn, forKey: "switchIsOn")
//        UserDefaults.standard.set(sender.isOn, forKey: "number")
//        UserDefaults.standard.set(sender.isOn, forKey: "string")
    }
    
    private func updateUI(isOn: Bool){
        view.backgroundColor = isOn ? .green : .red
        intLabel.text = isOn ? "\(Int(42))" : "\(Int(587))"
        textLabel.text = isOn ? "No homework from now on" : "Nope, still more homework"
        switchView.isOn = isOn
    }
    
}

