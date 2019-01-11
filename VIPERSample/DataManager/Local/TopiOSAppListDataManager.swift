//
//  TopiOSAppListDataManager.swift
//  VIPERSample
//
//  Created by Anderson Carvalho on 10/01/19.
//  Copyright © 2019 asfcarvalho. All rights reserved.
//

import UIKit
import CoreData

enum PersistenceError: Error {
    case manageObjectContextNotFound
    case couldNotSaveObject
}

class TopiOSappListDataManager: TopiOSAppListDataManagerInputProtocol {
    
    func getTopiOSAppListFetch() throws -> [TopiOSAppCoreData]{
        
        guard let manage = CoreDataStore.manageObjectContext else {
            throw PersistenceError.manageObjectContextNotFound
        }
        
        let request = NSFetchRequest<TopiOSAppCoreData>(entityName: String(describing: TopiOSAppCoreData.self))
        
        return try manage.fetch(request)
    }
    
    func createTopiOSAppList(name: String) throws {
        guard let manage = CoreDataStore.manageObjectContext else {
            throw PersistenceError.manageObjectContextNotFound
        }
        
        if let newTopiOSApp = NSEntityDescription.entity(forEntityName: "TopiOSAppCoreData",
                                                    in: manage) {
            let value = TopiOSAppCoreData(entity: newTopiOSApp, insertInto: manage)
            value.name = name
            
            try manage.save()
        }
        throw PersistenceError.couldNotSaveObject
    }
}
