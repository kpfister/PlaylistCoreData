//
//  Song+Convenience.swift
//  PlaylistCoreData
//
//  Created by Karl Pfister on 12/12/18.
//  Copyright © 2018 Karl Pfister. All rights reserved.
//

import Foundation
import CoreData

extension Song {
    
    @discardableResult // idk why but Karl said to
    convenience init(title: String, artist: String, playlist: Playlist, moc: NSManagedObjectContext = CoreDataStack.context) {
        
        self.init(context: moc)
        
        self.title = title
        self.artist = artist
        self.playlist = playlist
    }
}
