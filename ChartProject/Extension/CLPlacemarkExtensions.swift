//
//  CLPlacemarkExtensions.swift
//  SetTimer
//
//  Created by Manh Nguyen Ngoc on 02/07/2021.
//

import Foundation
import CoreLocation

extension CLPlacemark {
    func friendlyAddress() -> String {
        var components = [String]()
        
        if let name = self.name {
            components.append(name)
        }
        
        if let subLocality = self.subLocality {
            components.append(subLocality)
        }
        
        if let locality = self.locality {
            components.append(locality)
        }
        
        if let country = self.country {
            components.append(country)
        }
        
        return components.joined(separator: ", ")
    }
}
