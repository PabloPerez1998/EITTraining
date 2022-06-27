//
//  User.swift
//  CoreData
//
//  Created by Consultant on 6/22/22.
//

import Foundation
import CoreData

public class User: NSManagedObject{
    @NSManaged var name:String
    @NSManaged var age:Int16
    @NSManaged var createdDate:Date
}
