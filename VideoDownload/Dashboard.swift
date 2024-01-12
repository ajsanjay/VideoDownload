//
//  Dashboard.swift
//  VideoDownload
//
//  Created by jay sabeen on 10/01/24.
//

import SwiftUI

struct Dashboard: View {
    init() {
        UITabBar.appearance().backgroundColor = UIColor.brandPrimary
        UITabBar.appearance().unselectedItemTintColor = UIColor.white
        let color = UIColor.selectedSegmentClr
        let size = CGSize(width: UIScreen.main.bounds.size.width / 4, height: 80)
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        if let context = UIGraphicsGetCurrentContext() {
            context.setFillColor(color!.cgColor)
            context.fill(CGRect(origin: .zero, size: size))
            let colorImage = UIGraphicsGetImageFromCurrentImageContext()
            UITabBar.appearance().selectionIndicatorImage = colorImage
        }
        UIGraphicsEndImageContext()
    }
    var body: some View {
        TabView {
            MySpot()
                .tabItem {
                    Label("My Spot", systemImage: "film")
                        .environment(\.symbolVariants, .none)
                }
            BrowseClasses()
                .tabItem {
                    Label("Browse Classes", systemImage: "magnifyingglass")
                }
            Shop()
                .tabItem {
                    Label("Shop", systemImage: "handbag")
                        .environment(\.symbolVariants, .none)
                }
            LearnConnect()
                .tabItem {
                    Label("Learn & Connect", systemImage: "lightbulb")
                        .environment(\.symbolVariants, .none)
                }
        }
        .accentColor(.white)
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    Dashboard()
}
