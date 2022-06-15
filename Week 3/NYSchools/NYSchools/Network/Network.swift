//
//  Network.swift
//  NYSchools
//
//  Created by Consultant on 6/15/22.
//

import Foundation

struct Network{
    func fetchData(from url: String, completed: @escaping(Data?) -> Void){
        guard let url = URL(string: url) else {
            print("url error!", url)
            return
            
        }
        let session = URLSession.shared
        let task = session.dataTask(with: url) { data, response, error in
            guard error == nil else {
                print("Error: \(error?.localizedDescription ?? "Something stange happened")")
                return
            }
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                print("server error!")
                return
            }
            
            guard data != nil else {
                print("Error: We have no data bub")
                return
            }
            
            completed(data)
            
            
        }
        task.resume()
    }
    
    func fetchSchools(completed: @escaping([School]?) -> Void){
        let url = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json"
        fetchData(from: url){data in
            do {
                let results = try JSONDecoder().decode([School].self, from: data!)
                DispatchQueue.main.async {
                    completed(results)
                }
            } catch {
                print("Error net: \(error.localizedDescription)")
            }
            
        }
        
    }
    
    func fetchSchoolGrades(dbn: String, completed: @escaping([Grade]?) -> Void){
        let url = "https://data.cityofnewyork.us/resource/f9bf-2cp4.json?dbn=\(dbn)"
        fetchData(from: url){data in
            do {
                let results = try JSONDecoder().decode([Grade].self, from: data!)
                DispatchQueue.main.async {
                    completed(results)
                }
            } catch {
                print("Error net: \(error.localizedDescription)")
            }
            
        }
        
    }
}
