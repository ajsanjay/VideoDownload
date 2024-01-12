//
//  SecondarySegemnt.swift
//  VideoDownload
//
//  Created by jay sabeen on 11/01/24.
//

import SwiftUI

struct SecondarySegemnt: View {
    
    @Binding var index: Int
    
    var body: some View {
        HStack {
            Button {
                self.index = 0
                print("Downloads")
            } label: {
                VStack {
                    Text("Purchased Downloads")
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
                    Text("In-App Downloads")
                        .foregroundColor(self.index == 1 ? .selectedSegment : .black)
                    Capsule()
                        .fill(self.index == 1 ? .selectedSegment : .clear)
                        .frame(height: 3)
                }
            }
        }
        .padding(.top)
        .padding(.horizontal, 8)
        .frame(height: 82)
        Spacer()
    }
}

#Preview {
    SecondarySegemnt(index: .constant(0))
}
