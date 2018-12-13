//
//  SongsTableViewController.swift
//  PlaylistCoreData
//
//  Created by Karl Pfister on 12/12/18.
//  Copyright © 2018 Karl Pfister. All rights reserved.
//

import UIKit

class SongsTableViewController: UITableViewController {
    
    //MARK: Outlets
    var playlistLandingPad: Playlist?// Source of Truth
    
    @IBOutlet weak var artistNameTextField: UITextField!
    @IBOutlet weak var songNameTextField: UITextField!
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func plusButtonTapped(_ sender: Any) {
        
        guard let songName = songNameTextField.text, let artistName = artistNameTextField.text, let playlist = playlistLandingPad else { return }
        // Create the song
        SongController.sharedInstance.createSong(songWithTitle: songName, artist: artistName, playlist: playlist)
        
        // Clean up the dust
        songNameTextField.text = ""
        artistNameTextField.text = ""
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("🐸\(playlistLandingPad?.songs?.count ?? 0)🤢")
        return playlistLandingPad?.songs?.count ?? 0
    }
    
    

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongCell", for: indexPath)
        
        guard let unwrapppedPlaylist = playlistLandingPad else { return UITableViewCell() }
        if let song = unwrapppedPlaylist.songs?[indexPath.row] as? Song {
            cell.textLabel?.text = song.title
            cell.detailTextLabel?.text = song.artist
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let playlist = playlistLandingPad else { return }
            guard let song = playlist.songs?[indexPath.row] as? Song else { return }
            SongController.sharedInstance.deleteSong(song: song)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
