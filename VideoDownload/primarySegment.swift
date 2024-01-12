//
//  primarySegment.swift
//  VideoDownload
//
//  Created by jay sabeen on 11/01/24.
//

import SwiftUI

struct primarySegment: View {
    
    @Binding var index: Int
    
    var body: some View {
        HStack {
            Button {
                self.index = 0
                print("Downloads")
            } label: {
                VStack {
                    Image(systemName: "tray.and.arrow.down")
                        .foregroundColor(self.index == 0 ? .selectedSegment : .black)
                    Text("Downloads")
                        .foregroundColor(self.index == 0 ? .selectedSegment : .black)
                    Capsule()
                        .fill(self.index == 0 ? .selectedSegment : .clear)
                        .frame(height: 3)
                }
            }
            Button {
                self.index = 1
                print("Watch List")
            } label: {
                VStack {
                    Image(systemName: "eye.fill")
                        .foregroundColor(self.index == 1 ? .selectedSegment : .black)
                    Text("Watch List")
                        .foregroundColor(self.index == 1 ? .selectedSegment : .black)
                    Capsule()
                        .fill(self.index == 1 ? .selectedSegment : .clear)
                        .frame(height: 3)
                }
            }
            Button {
                self.index = 2
                print("Favorite")
            } label: {
                VStack {
                    Image(systemName: "heart.fill")
                        .foregroundColor(self.index == 2 ? .selectedSegment : .black)
                    Text("Favorite")
                        .foregroundColor(self.index == 2 ? .selectedSegment : .black)
                    Capsule()
                        .fill(self.index == 2 ? .selectedSegment : .clear)
                        .frame(height: 3)
                }
            }
            Button {
                self.index = 3
                print("Weekly Workout")
            } label: {
                VStack {
                    Image(systemName: "menucard")
                        .foregroundColor(self.index == 3 ? .selectedSegment : .black)
                    Text("Weekly Workouts")
                        .foregroundColor(self.index == 3 ? .selectedSegment : .black)
                    Capsule()
                        .fill(self.index == 3 ? .selectedSegment : .clear)
                        .frame(height: 3)
                }
            }
        }
        .padding(.top)
        .padding(.horizontal, 8)
        .frame(height: 82)
    }
}

#Preview {
    primarySegment(index: .constant(0))
}
