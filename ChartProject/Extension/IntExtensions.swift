//
//  IntExtensions.swift
//  SetTimer
//
//  Created by Manh Nguyen Ngoc on 02/07/2021.
//

import Foundation

extension Int {
    func timeString() -> String {        
        let minute = self / 60 % 60
        let second = self % 60

        // return formated string
        return String(format: "%02d:%02d", minute, second)
    }
}
