//
//  CIImageExtensions.swift
//  SetTimer
//
//  Created by Manh Nguyen Ngoc on 02/07/2021.
//

import Foundation
import UIKit

extension CIImage {
    func toUIImage() -> UIImage {
           let context: CIContext = CIContext.init(options: nil)
           let cgImage: CGImage = context.createCGImage(self, from: self.extent)!
           let image: UIImage = UIImage.init(cgImage: cgImage)
           return image
    }
}
