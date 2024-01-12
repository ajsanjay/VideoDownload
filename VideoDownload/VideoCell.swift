//
//  VideoCell.swift
//  VideoDownload
//
//  Created by jay sabeen on 11/01/24.
//

import SwiftUI

struct VideoCell: View {
    
    @StateObject var viewModel = VideoCellViewModel()
    
    let cellData: MySpotModel
    
    var body: some View {
        HStack {
            Spacer()
            Image(uiImage: UIImage().createThumbnailOfVideoFromFileURL(videoURL: cellData.videoUrl)!)
                .aspectRatio(contentMode: .fit)
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
                        print("Selected button")
                        switch viewModel.status {
                        case .Download:
                            viewModel.startDownloading(urlString: cellData.videoUrl)
                            viewModel.status = .Stop
                        case .Stop:
                            viewModel.downloadTaskSession.cancel()
                            viewModel.status = .Download
                        case .Delete:
                            viewModel.status = .Download
                        case .none:
                            viewModel.status = .Download
                        }
                    } label: {
                        HStack {
                            Text(viewModel.status?.rawValue ?? "Download")
                                .foregroundColor(.white)
                        }
                    }
                    .frame(width: 180, height: 45)
                    .background(.primaryColour)
                    Spacer()
                }
            }
            .padding()
        }
    }
}

#Preview {
    VideoCell(cellData: MockData.sampleData1)
}
