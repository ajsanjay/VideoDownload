//
//  ProgressBar.swift
//  VideoDownload
//
//  Created by jay sabeen on 11/01/24.
//

import SwiftUI

struct ProgressBar: View {
    
    @Binding var value: CGFloat
    var model = ProgrssBarModel.self
    
    var body: some View {
        ZStack(alignment: .leading) {
            Capsule()
                .frame(height: 3)
                .foregroundColor(.primaryColour).opacity(0.2)
                .frame(width: model.screenWidth - 200)
            Capsule()
                .frame(height: 3)
                .foregroundColor(.primaryColour)
                .frame(width: (model.screenWidth - 200)*(value))
        }
    }
}

#Preview {
    ProgressBar(value: .constant(0.3))
}
