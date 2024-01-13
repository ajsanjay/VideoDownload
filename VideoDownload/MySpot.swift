//
//  MySpot.swift
//  VideoDownload
//
//  Created by jay sabeen on 10/01/24.
//

import SwiftUI

struct MySpot: View {
    
    @State var primaryIndex: Int = 0
    @State var secondaryIndex: Int = 0
    @StateObject var viewModel = MySpotListViewModel()
    @State var listContent: [MySpotModel] = [MockData.sampleData1, MockData.sampleData2, MockData.sampleData3, MockData.sampleData4, MockData.sampleData5]
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    HStack {
                        Button {
                            print("Menu Tapped")
                        } label: {
                            Image(systemName: "line.3.horizontal")
                        }
                        .padding()
                        Button {
                            print("Home Tapped")
                        } label: {
                            Image(systemName: "house.fill")
                        }
                        Spacer()
                        Text("My Spot")
                        Spacer()
                        Button {
                            print("Cart Tapped")
                        } label: {
                            Image(systemName: "cart")
                        }
                        .padding()
                    }
                    .frame(height: 80)
                    .background(.primaryColour)
                    ZStack {
                        Image(uiImage: UIImage(named: "DasbordBg")!)
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width, height: 90)
                    }
                    primarySegment(index: $primaryIndex)
                    SecondarySegemnt(index: $secondaryIndex)
                    List($listContent) { videos in
                        VideoCell(cellData: videos)
                            .listRowSeparator(.hidden)
                    }
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    MySpot()
}
