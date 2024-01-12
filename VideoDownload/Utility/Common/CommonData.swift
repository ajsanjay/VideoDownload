//
//  CommonData.swift
//  VideoDownload
//
//  Created by jay sabeen on 11/01/24.
//

import Foundation

enum DownloadButtonTyp: String {
    case Download
    case Stop
    case Delete
}

func convertToButtonTyp(val: Int) -> DownloadButtonTyp {
    switch val {
    case 1:
        return .Stop
    case 2:
        return .Delete
    default:
        return .Download
    }
}
