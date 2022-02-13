//
//  PokeVideo.swift
//  trabalho_turma
//
//  Created by Ivan Nunes on 24/01/2022.
//

import Foundation
import SwiftUI
import UIKit
import AVKit
import AVFoundation

struct PlayerView: UIViewRepresentable {
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<PlayerView>) {
    }

    func makeUIView(context: Context) -> UIView {
        return LoopingPlayerUIView(frame: .zero)
    }
}

class LoopingPlayerUIView: UIView {
    private let playerLayer = AVPlayerLayer()
    private var playerLooper: AVPlayerLooper?
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        // Load the resource -> h
        let fileUrl = Bundle.main.url(forResource: "poke_intro", withExtension: "mp4")!
        let asset = AVAsset(url: fileUrl)
        let item = AVPlayerItem(asset: asset)
        // Setup the player
        @State var player = AVQueuePlayer()
        playerLayer.player = player
        playerLayer.videoGravity = .resizeAspectFill
        layer.addSublayer(playerLayer)
        // Create a new player looper with the queue player and template item
        playerLooper = AVPlayerLooper(player: player, templateItem: item)
        player.pause()
        // Start the movie
        player.play()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }

}
