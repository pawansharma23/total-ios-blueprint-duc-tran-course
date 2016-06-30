//
//  AlbumViewController.swift
//  Playlist
//
//  Created by Jorge Jimenez on 6/28/16.
//  Copyright © 2016 xadrijoLab. All rights reserved.
//

import UIKit

class AlbumViewController: UIViewController {
    
    // Model an album
    var album: Album?
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var albumCoverImageView: UIImageView!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    // Update the UI with the model
    func updateUI() {
        
        if let albumName = album?.coverImageName {
            backgroundImageView.image = UIImage(named: albumName)
            albumCoverImageView.image = UIImage(named: albumName)
        }
        
        let songList = ((album?.songs)! as NSArray).componentsJoinedByString(", ")
        descriptionTextView.text = "\((album?.description)!) \n\nSome songs in the album:\n\(songList)"
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Album"
        updateUI()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Gets the background image out of the way when the view dissapears
        backgroundImageView?.removeFromSuperview()
    }
}
