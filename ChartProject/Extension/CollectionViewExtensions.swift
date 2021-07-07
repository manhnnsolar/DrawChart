//
//  CollectionViewExtensions.swift
//  SetTimer
//
//  Created by Manh Nguyen Ngoc on 02/07/2021.
//

import Foundation
import UIKit

extension UICollectionView {
    func registerCell<T>(type: T.Type) {
        let name = String(describing: type)
        self.register(UINib(nibName: name, bundle: nil), forCellWithReuseIdentifier: name)
    }

    func registerHeader<T>(type: T.Type) {
        let name = String(describing: type)
        self.register(UINib(nibName: name, bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: name)
    }

    func dequeueCell<T>(type: T.Type, indexPath: IndexPath) -> T? {
        let name = String(describing: type)
        return self.dequeueReusableCell(withReuseIdentifier: name, for: indexPath) as? T
    }

    func dequeueHeader<T>(type: T.Type, indexPath: IndexPath) -> T? {
        let name = String(describing: type)
        return self.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: name, for: indexPath) as? T
    }
}
