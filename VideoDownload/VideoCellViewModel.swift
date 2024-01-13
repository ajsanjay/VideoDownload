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
//    @Published var downloadLocation: URL!
    @Published var alertItem: AlertItem?
    @Published var status: DownloadButtonTyp?
    @Published var sessionConfig: URLSession?
    @Published var isDownloaded: Bool = false
    
    private var id: Int!
        
    func startDownloading(urlString: String, idVal: Int) {
        id = idVal
        guard let isValidUrl = URL(string: urlString) else { return }
        sessionConfig = URLSession(configuration: .default, delegate: self, delegateQueue: nil)
        self.downloadTaskSession = sessionConfig?.downloadTask(with: isValidUrl)
        self.downloadTaskSession.resume()
    }
    
    nonisolated func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        print(location)
        guard let url = downloadTask.originalRequest?.url else { return }
        let directoryPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let destinationURL = directoryPath.appendingPathComponent (url.lastPathComponent)
        try? FileManager.default.removeItem(at: destinationURL)
        do {
            try FileManager.default.copyItem(at: location, to: destinationURL)
        } catch {
            print ("file error: \(error)")
        }
        DispatchQueue.main.async {
            self.status = .Download
            self.isDownloaded = true
            self.renameSavedFile()
        }
    }
    
    func renameSavedFile() {
        let fileName = "\(id ?? 0)_file.mp4"
        print(fileName)
        do {
            let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
            let documentDirectory = URL(fileURLWithPath: path)
            let originPath = documentDirectory.appendingPathComponent("file.mp4")
            let destinationPath = documentDirectory.appendingPathComponent(fileName)
            try FileManager.default.moveItem(at: originPath, to: destinationPath)
        } catch {
            print(error)
        }
    }
    
    nonisolated func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        let progress = CGFloat(totalBytesWritten) / CGFloat(totalBytesExpectedToWrite)
        DispatchQueue.main.async {
            self.downloadProgress = progress
        }
    }
    
}
