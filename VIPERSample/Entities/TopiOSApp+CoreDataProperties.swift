//
//  TopiOSApp+CoreDataProperties.swift
//  VIPERSample
//
//  Created by Anderson Carvalho on 10/01/19.
//  Copyright © 2019 asfcarvalho. All rights reserved.
//

import UIKit
import  CoreData

class TopiOSAppCoreData: NSManagedObject {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<TopiOSAppCoreData> {
        return NSFetchRequest<TopiOSAppCoreData>(entityName: "TopiOSAppCoreData");
    }
    
    @NSManaged public var name: String?
}

