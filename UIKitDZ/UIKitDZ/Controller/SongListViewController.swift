// SongListViewController.swift
// Copyright © RoadMap. All rights reserved.

import AVFoundation
import UIKit

/// Начальный экран, где отображается список наших песен
final class SongListViewController: UIViewController {
    // MARK: - Private Properties

    private var songNameToPass: String?
    private var songArtistNameToPass: String?
    private var songCoverToPass: String?
    private var songToPlay: AVPlayerItem?

    var playerItems: [AVPlayerItem] = []

    // MARK: - IBOutlets

    @IBOutlet private var jadenImage: UIButton!
    @IBOutlet private var linkinParkImage: UIButton!

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        createPlaylist()
    }

    // MARK: - Private Methods

    private func createPlaylist() {
        guard let url1 = Bundle.main.url(forResource: "on my own", withExtension: "mp3"),
              let url2 = Bundle.main.url(forResource: "somewhere i belong", withExtension: "mp3") else { return }
        let urls = [url1, url2]
        for index in 0 ... 1 {
            let item = AVPlayerItem(url: urls[index])
            playerItems.append(item)
        }
    }

    private func setupUI() {
        jadenImage.imageView?.contentMode = .scaleAspectFill
        linkinParkImage.imageView?.contentMode = .scaleAspectFill
    }

    // MARK: - IBActions

    @IBAction func jadenSongTappped(_ sender: UIButton) {
        songNameToPass = "On My Own"
        songCoverToPass = "jaden"
        songToPlay = playerItems[0]
        songArtistNameToPass = "Jaden"

        performSegue(withIdentifier: "segueToPlayer", sender: self)
    }

    @IBAction func linkinParkSongTapped(_ sender: UIButton) {
        songNameToPass = "Somewhere I Belong"
        songCoverToPass = "linkinPark"
        songToPlay = playerItems[1]
        songArtistNameToPass = "Linkin Park"

        performSegue(withIdentifier: "segueToPlayer", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "segueToPlayer" else { return }
        guard let destination = segue.destination as? PlayerViewController,
              let song = songToPlay else { return }
        destination.songName = songNameToPass
        destination.songCover = songCoverToPass
        destination.setupPlayer(songToPlay: song)
        destination.songArtistName = songArtistNameToPass
        destination.playerItems = playerItems
    }
}
