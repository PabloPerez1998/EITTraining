//
//  ViewController.swift
//  FileManager
//
//  Created by Consultant on 6/22/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let manager = FileManager.default
        guard let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return
        }
        
        let newFolder = url.appendingPathComponent("Test").appendingPathComponent("Second-Test")
//        CREATE DIRECTORY
//        do{
////            try manager.createDirectory(at: newFolder, withIntermediateDirectories: true, attributes: [:])
//
//        }catch{
//            print(error)
//        }
//        CREATE AND WRITE A FILE
        let fileUrl = newFolder.appendingPathComponent("logs.txt")
        let data = "Soy un texto".data(using: .utf8)
        manager.createFile(atPath: fileUrl.path, contents: data, attributes: [FileAttributeKey.creationDate: Date()])
//        DELETE FILE
        if(manager.fileExists(atPath: fileUrl.path)){
            do{
                try manager.removeItem(at: fileUrl)
            }catch{
                print(error)
            }
        }
       
    }


}

