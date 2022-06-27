//
//  DatabaseHandler.swift
//  CoreData
//
//  Created by Consultant on 6/22/22.
//

import Foundation
import UIKit
import CoreData

class DataBaseHandler{
    private let viewContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func add<T: NSManagedObject>(_ type: T.Type) -> T? {
        guard let entityName = T.entity().name else{
            return nil
        }
        guard let entity = NSEntityDescription.entity(forEntityName: entityName, in: viewContext) else { return nil }
        let object = T(entity: entity, insertInto: viewContext)
        
        return object
    }
    
    func fetch<T:NSManagedObject>(_ type: T.Type) -> [T]{
        let request = T.fetchRequest()
    }
}
