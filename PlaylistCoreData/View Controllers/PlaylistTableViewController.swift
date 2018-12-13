//
//  PlaylistTableViewController.swift
//  PlaylistCoreData
//
//  Created by Karl Pfister on 12/12/18.
//  Copyright © 2018 Karl Pfister. All rights reserved.
//

import UIKit

class PlaylistTableViewController: UITableViewController {
    
    // MARK: Outlets
    @IBOutlet weak var playlistNameLabel: UITextField!
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // MARK: Actions
    @IBAction func addButtonTapped(_ sender: Any) {
        guard let playlistName = playlistNameLabel.text, !playlistName.isEmpty else { return }
        
        PlaylistController.sharedInstance.createPlaylist(playlistWithName: playlistName)
        // clean up dust
        playlistNameLabel.text = ""
        tableView.reloadData()
    }
    // MARK: - Table view data source
   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return PlaylistController.sharedInstance.playlists.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playlistCell", for: indexPath)
        let playlist = PlaylistController.sharedInstance.playlists[indexPath.row]
        let songCount = playlist.songs?.count ?? 0
        
        cell.textLabel?.text = playlist.name
        cell.detailTextLabel?.text = String(songCount)

        return cell
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let playlist = PlaylistController.sharedInstance.playlists[indexPath.row]
            PlaylistController.sharedInstance.deletePlaylist(playistToDelete: playlist)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    

    // MARK: - Navigation
    override  func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         /*
         I - Identifier
         I - IndexPathForSelectedRow
         D - DestinationViewController
         O - Object from Source of Truth
         O - Setting Object landing pad
         */
        if segue.identifier == "ToDetailVC" {
            guard let index = tableView.indexPathForSelectedRow else { return }
            guard let destinationVC = segue.destination as? SongsTableViewController else { return}
//            print("\n", index.row, "🐸")
//            PlaylistController.sharedInstance.playlists.forEach { print($0.name ?? "", terminator: ", ")}
            let playlist = PlaylistController.sharedInstance.playlists[index.row]
            destinationVC.playlistLandingPad = playlist
        }
    }

}

//                      0          1        2        3
// let playlists = ["Jaydens", "Jacks", "Lukes", "Camerons"]
// let jaydens = playlists[0]
// let jacks = playlists[1]
// let lukes = playlists[2]
// let camerons = playlists[3]


