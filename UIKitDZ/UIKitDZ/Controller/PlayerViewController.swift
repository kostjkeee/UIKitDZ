// PlayerViewController.swift
// Copyright © RoadMap. All rights reserved.

import AVFoundation
import UIKit

/// Экран,  отвечающий за отображение нашего плеера
final class PlayerViewController: UIViewController {
    // MARK: - IBOutlets

    @IBOutlet var currentSongImageView: UIImageView!
    @IBOutlet var currentSongName: UILabel!
    @IBOutlet var currentSongArtist: UILabel!
    @IBOutlet var currentSongDuration: UISlider!
    @IBOutlet var volumeSlider: UISlider!
    @IBOutlet var playButton: UIButton!
    @IBOutlet var currentSongTotalDuration: UILabel!

    // MARK: - Public Properties

    var songName: String?
    var songArtistName: String?
    var songCover: String?
    var playerItems: [AVPlayerItem] = []

    // MARK: - Private Properties

    private var player: AVPlayer?
    private var timer: Timer?

    private var isMusicPlaying = false {
        didSet {
            if isMusicPlaying == true {
                playButton.setImage(UIImage(systemName: "pause.circle"), for: .normal)
            } else {
                playButton.setImage(UIImage(systemName: "play.circle"), for: .normal)
            }
        }
    }

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configurePlayer()
        currentSongImageView.layer.borderWidth = 1
        currentSongImageView.layer.borderColor = UIColor.white.cgColor
    }

    // MARK: - Public Methods

    func setupPlayer(songToPlay: AVPlayerItem) {
        player = AVPlayer(playerItem: songToPlay)
    }

    // MARK: - IBActions

    @IBAction private func cancelTapped(_ sender: UIButton) {
        dismiss(animated: true)
        player = nil
    }

    @IBAction private func playTapped(_ sender: UIButton) {
        guard player != nil else { return }
        timer?.fire()
        if isMusicPlaying == true {
            player?.pause()
            isMusicPlaying = false
        } else {
            player?.play()
            isMusicPlaying = true
        }
    }

    @IBAction private func backwardTapped(_ sender: UIButton) {
        guard let currentPlayerItem = player?.currentItem,
              let index = playerItems.firstIndex(of: currentPlayerItem) else { return }
        let nextPlayerItem = playerItems[(index + 1) % playerItems.count]
        player?.replaceCurrentItem(with: nextPlayerItem)
        changeCurrentSongData()
        player?.play()
    }

    @IBAction private func forwardTapped(_ sender: UIButton) {
        guard let currentPlayerItem = player?.currentItem,
              let index = playerItems.firstIndex(of: currentPlayerItem) else { return }
        let nextPlayerItem = playerItems[(index + 1) % playerItems.count]
        player?.replaceCurrentItem(with: nextPlayerItem)
        changeCurrentSongData()
        player?.play()
    }

    @IBAction private func songDurationChanged(_ sender: UISlider) {
        guard let player = player else { return }
        player.seek(to: CMTime(seconds: Double(sender.value), preferredTimescale: 1))
    }

    @IBAction private func songVolumeChanged(_ sender: UISlider) {
        guard player != nil else { return }
        player?.volume = sender.value
    }

    // MARK: - Private Methods

    private func setupUI() {
        guard songName != nil,
              songCover != nil,
              songArtistName != nil else { return }
        volumeSlider.frame.origin = CGPoint(x: 0, y: 210)
        volumeSlider.value = volumeSlider.maximumValue / 2
        player?.volume = volumeSlider.value
        isMusicPlaying = true
        currentSongName.text = songName
        currentSongArtist.text = songArtistName
        currentSongImageView.image = UIImage(named: songCover ?? "")
        player?.play()
    }

    private func changeCurrentSongData() {
        if player?.currentItem == playerItems[0] {
            currentSongName.text = "On My Own"
            currentSongArtist.text = "Jaden"
            currentSongImageView.image = UIImage(named: "jaden")
        } else {
            currentSongName.text = "Somewhere I Belong"
            currentSongArtist.text = "Linkin Park"
            currentSongImageView.image = UIImage(named: "linkinPark")
        }
    }

    private func configurePlayer() {
        guard let totalDuration = player?.currentItem?.asset.duration else { return }
        let seconds = CMTimeGetSeconds(totalDuration)
        currentSongDuration.maximumValue = Float(seconds)
        let songTotalDurationInSeconds = CMTimeGetSeconds(totalDuration)
        let finishDuration = convertTimeToString(time: TimeInterval(songTotalDurationInSeconds))
        currentSongTotalDuration.text = finishDuration
        timer = Timer.scheduledTimer(
            timeInterval: 0.0,
            target: self,
            selector: #selector(musicTimeChanged),
            userInfo: nil,
            repeats: true
        )
    }

    private func convertTimeToString(time: TimeInterval) -> String {
        let minute = Int(time) / 60 % 60
        let second = Int(time) % 60
        return String(format: "%02i:%02i", minute, second)
    }

    @objc private func musicTimeChanged() {
        guard player != nil else { return }
        guard let totalDuration = player?.currentItem?.asset.duration else { return }
        let currentMusicTime = player?.currentTime().seconds ?? 0.0
        let songTotalDurationInSeconds = CMTimeGetSeconds(totalDuration)
        let totalDurationInDouble = Double(songTotalDurationInSeconds)
        let leftTime = totalDurationInDouble - currentMusicTime
        let finishDuration = convertTimeToString(time: TimeInterval(leftTime))
        currentSongDuration.setValue(Float(currentMusicTime), animated: true)
        currentSongTotalDuration.text = finishDuration
    }
}
