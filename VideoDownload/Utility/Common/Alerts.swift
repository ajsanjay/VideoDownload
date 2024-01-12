//
//  Alerts.swift
//  VideoDownload
//
//  Created by jay sabeen on 12/01/24.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    static let fileDownloaded = AlertItem(title: Text("Download Complete 🥱"), message: Text("The video have sucessfully downloaded"), dismissButton: .default(Text("Ok")))
    static let downloadErr = AlertItem(title: Text("Download In Complete 🤯"), message: Text("There is an error on Downloading the video"), dismissButton: .default(Text("Ok")))
    static let retriveErr = AlertItem(title: Text("Failed to retrive 🤯"), message: Text("There is an error occured while retriving the data"), dismissButton: .default(Text("Ok")))
    static let unableToResume = AlertItem(title: Text("Unable to Resume 🤯"), message: Text("There is an error occured so you cannot resume the download"), dismissButton: .default(Text("Ok")))
}
