//
//  DictionaryExtension.swift
//  SetTimer
//
//  Created by Manh Nguyen Ngoc on 02/07/2021.
//

import Foundation

extension Dictionary {
    func jsonString() -> String {
        guard let jsonData = try? JSONSerialization.data(withJSONObject: self, options: [.prettyPrinted]) else {
            return ""
        }
        
        return String(data: jsonData, encoding: .utf8) ?? ""
    }
}
