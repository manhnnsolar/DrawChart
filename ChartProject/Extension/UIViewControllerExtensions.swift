//
//  UIViewControllerExtensions.swift
//  SetTimer
//
//  Created by Manh Nguyen Ngoc on 02/07/2021.
//

import Foundation
import UIKit

extension UIViewController {
    func topVC() -> UIViewController {
        if let navigation = self as? UINavigationController, !navigation.viewControllers.isEmpty {
            return navigation.topViewController!.topVC()
        }
        
        if let presentedVC = self.presentedViewController {
            return presentedVC.topVC()
        }
        
        return self
    }
}
