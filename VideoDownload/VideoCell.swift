//
//  VideoCell.swift
//  VideoDownload
//
//  Created by jay sabeen on 11/01/24.
//

import SwiftUI

struct VideoCell: View {
    
    @StateObject var viewModel = VideoCellViewModel()
    @Binding var cellData: MySpotModel
    
    var body: some View {
        HStack {
            Spacer()
            ZStack {
                Image(uiImage: UIImage().createThumbnailOfVideoFromFileURL(videoURL: cellData.videoUrl)!)
                    .aspectRatio(contentMode: .fit)
                if viewModel.isDownloaded || findFileExist(ids: cellData.id) {
                    NavigationLink("Play Video") {
                        VideoPlayerView(vidUrl: playVideoFile(ids: cellData.id))
                    }
                    Image(systemName: "play.fill")
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.primaryColour)
                        .background(.white).opacity(0.2)
                }
            }
            .frame(width: 150, height: 130, alignment: .center)
            .cornerRadius(0)
            VStack {
                Text(cellData.heading)
                    .font(.title3)
                    .fontWeight(.medium)
                    .padding(.leading , -14)
                if viewModel.status == .Stop {
                    ProgressBar(value: $viewModel.downloadProgress)
                        .padding(.leading, -15)
                        .padding(.trailing, 2)
                }
                HStack {
                    Button {
                        if viewModel.isDownloaded || findFileExist(ids: cellData.id) {
                            deletVideo(ids: cellData.id)
                        } else {
                            switch viewModel.status {
                            case .Download:
                                viewModel.startDownloading(urlString: cellData.videoUrl, idVal: cellData.id)
                                viewModel.status = .Stop
                            case .Stop:
                                viewModel.downloadTaskSession.cancel()
                                viewModel.status = .Download
                            case .none:
                                viewModel.startDownloading(urlString: cellData.videoUrl, idVal: cellData.id)
                                viewModel.status = .Stop
                            }
                        }
                    } label: {
                        HStack {
                            if viewModel.isDownloaded || findFileExist(ids: cellData.id) {
                                Text("Delete")
                                    .foregroundColor(.white)
                            } else {
                                Text(viewModel.status?.rawValue ?? "Download")
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    .frame(width: 180, height: 45)
                    .background(.primaryColour)
                    .buttonStyle(BorderlessButtonStyle())
                    Spacer()
                }
            }
            .padding()
        }
    }
    
    func playVideoFile(ids: Int) -> URL {
        let documentsFolder = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        let videoURL = documentsFolder.appendingPathComponent("\(ids)_file.mp4")
        return videoURL
    }
    
    func findFileExist(ids: Int) -> Bool {
        let documentsFolder = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let url = NSURL(fileURLWithPath: documentsFolder)
        if let pathComponent = url.appendingPathComponent("\(ids)_file.mp4") {
            let filePath = pathComponent.path
            let fileManager = FileManager.default
            return fileManager.fileExists(atPath: filePath)
        } else {
            print("FILE PATH NOT AVAILABLE")
            return false
        }
    }
    
    func deletVideo(ids: Int) {
        let documentsFolder = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let url = NSURL(fileURLWithPath: documentsFolder)
        if let pathComponent = url.appendingPathComponent("\(ids)_file.mp4") {
            let filePath = pathComponent.path
            let fileManager = FileManager.default
            do {
                try fileManager.removeItem(atPath: filePath)
                viewModel.isDownloaded = false
            } catch {
                print("Could not delete file, probably read-only filesystem")
                viewModel.isDownloaded = true
            }
        } else {
            print("FILE PATH NOT AVAILABLE")
            viewModel.isDownloaded = true
        }
    }
    
}

#Preview {
    VideoCell(cellData: .constant(MockData.sampleData1))
}
