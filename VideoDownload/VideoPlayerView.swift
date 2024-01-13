//
//  VideoPlayerView.swift
//  VideoDownload
//
//  Created by jay sabeen on 13/01/24.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    
    @State private var player = AVPlayer()
    
    var vidUrl: URL
    
    var body: some View {
        VideoPlayer(player: player)
            .edgesIgnoringSafeArea(.all)
            .task {
                player = AVPlayer(url: vidUrl)
                player.play()
            }
            .onDisappear {
                player.pause()
            }
    }
}

//#Preview {
//    VideoPlayerView(vidUrl: "")
//}
