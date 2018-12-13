//
//  PlaylistController.swift
//  PlaylistCoreData
//
//  Created by Karl Pfister on 12/12/18.
//  Copyright © 2018 Karl Pfister. All rights reserved.
//

import Foundation
import CoreData

class PlaylistController {
    
    // MARK: Singlton
    static let sharedInstance = PlaylistController()
    //MARK: CRUD
    var playlists: [Playlist] {
        let fetchRequest: NSFetchRequest<Playlist> = Playlist.fetchRequest()
        return (try? CoreDataStack.context.fetch(fetchRequest)) ?? []
    }
    // CREATE
    func createPlaylist(playlistWithName name: String) {
        Playlist(name: name)
        // Save To PS
        saveToPersistentStore()
    }
    // DELETE
    
    func deletePlaylist(playistToDelete: Playlist) {
        CoreDataStack.context.delete(playistToDelete)
        saveToPersistentStore()
    }
    
    // Save
    func saveToPersistentStore() {
        //TODO: Finish
        do {
            try CoreDataStack.context.save()
        } catch {
            print("There was an error in \(#function) : \(error.localizedDescription)")
        }
    }
}
