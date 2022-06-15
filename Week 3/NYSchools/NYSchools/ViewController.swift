//
//  ViewController.swift
//  NYSchools
//
//  Created by Consultant on 6/15/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var schools = [School]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        fetchData()
        
    }
    
    func fetchData(){
        Network().fetchSchools(){result in
            self.schools = result ?? []
            self.tableView.reloadData()
        }
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schools.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = schools[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let school = self.schools[indexPath.row]
        Network().fetchSchoolGrades(dbn: school.dbn){result in
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "Details") as! DetailViewController
            vc.school = school
            vc.grades = result!.count > 0 ? result?[0] : nil
            self.navigationController?.show(vc, sender:nil)
        }
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailViewController {
            let school = schools[(tableView.indexPathForSelectedRow?.row)!]
            destination.school = school
        }
    }
    
    
}

