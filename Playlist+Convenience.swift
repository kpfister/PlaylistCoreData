//
//  Playlist+Convenience.swift
//  PlaylistCoreData
//
//  Created by Karl Pfister on 12/12/18.
//  Copyright © 2018 Karl Pfister. All rights reserved.
//

import Foundation
import CoreData

extension Playlist {

    convenience init(name: String, songs: [Song] = [], moc: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: moc)
        self.name = name
        
    }
}
