//
//  MySpotModel.swift
//  VideoDownload
//
//  Created by jay sabeen on 11/01/24.
//

import Foundation

struct MySpotModel: Identifiable {
    let videoUrl: String
    let heading: String
    let id: Int
}

struct DownloadInfos: Codable {
    let status: Int
    let videoName: String
    let id: Int
}

struct DownloadedVideos: Codable {
    var videos: [DownloadInfos]?
}

struct MockData {
    static let sampleData1 = MySpotModel(videoUrl: "https://player.vimeo.com/progressive_redirect/playback/433925279/rendition/1080p/file.mp4?loc=external&signature=50856478a378907bc656554b1de94f38a7704cc9206c9bff46a83cfb36f35e63", heading: "Age is Relative: A Spain workout for older adults", id: 1)
    static let sampleData2 = MySpotModel(videoUrl: "https://player.vimeo.com/progressive_redirect/playback/433927495/rendition/360p/file.mp4?loc=external&signature=02578fff5efc682f5afde55867c62a496a6a654107831fded0b3b48c8bd8038c", heading: "15 min Bed time Yoga", id: 2)
    static let sampleData3 = MySpotModel(videoUrl: "https://player.vimeo.com/progressive_redirect/playback/433664412/rendition/720p/file.mp4?loc=external&signature=c181e93e63d3979c0b9124f6a9dd98ea48c28d7d2598bedbe33f94663d6b16b6", heading: "Mat pilates w/ Thera Brands", id: 3)
    static let sampleData4 = MySpotModel(videoUrl: "https://player.vimeo.com/progressive_redirect/playback/433937419/rendition/1080p/file.mp4?loc=external&signature=5e84d1bcbbd42caf7fab6e63e284b0383b2e4e02f5cd6d76f102670099a5ff94", heading: "Sample Info 4", id: 4)
    static let sampleData5 = MySpotModel(videoUrl: "https://player.vimeo.com/progressive_redirect/playback/433947577/rendition/1080p/file.mp4?loc=external&signature=946c6b2133120806a0cbaeec334708dda1dd7bb6f399f2e6f14224a61bf164ca", heading: "Sample Info 5", id: 5)
//    static let sampleData = [sampleData1, sampleData2, sampleData3, sampleData4, sampleData5]
}
