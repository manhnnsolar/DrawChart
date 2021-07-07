//
//  TimeIntervalExtensions.swift
//  SetTimer
//
//  Created by Manh Nguyen Ngoc on 02/07/2021.
//

import Foundation
import AVFoundation

extension TimeInterval {
    func toDurationString() -> String {
        let seconds: Int = Int(self) % 60
        let minutes = Int(self / 60)
        return String.init(format: "%02d:%02d", minutes, seconds)
    }
}

extension CMTime {
    func toDouble() -> Float64 {
        return CMTimeGetSeconds(self)
    }
}
