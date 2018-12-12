//
//  CoreDataStack.swift
//  PlaylistCoreData
//
//  Created by Karl Pfister on 12/12/18.
//  Copyright © 2018 Karl Pfister. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    
    static let container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "PlaylistCoreData")
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error{
                fatalError("Failed to Load Persistent Store \(error)")
            }
        })
        return container
    }()
    
    static var context: NSManagedObjectContext{
        return container.viewContext
    }
}
