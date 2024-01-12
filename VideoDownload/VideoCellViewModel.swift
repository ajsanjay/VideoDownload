//
//  VideoCellViewModel.swift
//  VideoDownload
//
//  Created by jay sabeen on 11/01/24.
//

import Foundation
import SwiftUI


@MainActor final class VideoCellViewModel: NSObject, ObservableObject, URLSessionDownloadDelegate {
    
    @Published var downloadTaskSession: URLSessionDownloadTask!
    @Published var downloadProgress: CGFloat = 0
    @Published var downloadLocation = ""
    @Published var alertItem: AlertItem?
    @Published var status: DownloadButtonTyp?
    @Published var sessionConfig: URLSession?
        
    func startDownloading(urlString: String) {
        guard let isValidUrl = URL(string: urlString) else { return }
        sessionConfig = URLSession(configuration: .default, delegate: self, delegateQueue: nil)
        self.downloadTaskSession = sessionConfig?.downloadTask(with: isValidUrl)
        self.downloadTaskSession.resume()
    }
    
    nonisolated func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        print(location)
        DispatchQueue.main.async {
            self.status = .Delete
            self.downloadLocation = location.absoluteString
        }
    }
    
    nonisolated func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        let progress = CGFloat(totalBytesWritten) / CGFloat(totalBytesExpectedToWrite)
        DispatchQueue.main.async {
            self.downloadProgress = progress
        }
    }
    
}
