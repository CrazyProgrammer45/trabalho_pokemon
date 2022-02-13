//
//  PokeIntro.swift
//  trabalho_turma
//
//  Created by Ivan Nunes on 18/01/2022.
//

import UIKit
import AVKit
import AVFoundation

class PokeIntro: UIViewController {

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        playVideo()
    }

    private func playVideo() {
        guard let path = Bundle.main.path(forResource: "y2mate.com - Pokémon Season 1 Indigo League  Opening Theme_480", ofType:"mp4") else {
            debugPrint("video.mp4 not found")
            return
        }
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        let playerController = AVPlayerViewController()
        playerController.player = player
        present(playerController, animated: true) {
            player.play()
        }
    }
}
