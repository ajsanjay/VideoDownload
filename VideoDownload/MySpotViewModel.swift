//
//  MySpotViewModel.swift
//  VideoDownload
//
//  Created by jay sabeen on 11/01/24.
//

import SwiftUI

@MainActor final class MySpotListViewModel: ObservableObject {
    
    @Published var videos = DownloadedVideos()
    @Published var alertItem: AlertItem?
    
}
