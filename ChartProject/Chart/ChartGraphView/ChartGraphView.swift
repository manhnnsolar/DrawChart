//
//  ChartGraphView.swift
//  ChartProject
//
//  Created by Manh Nguyen Ngoc on 07/07/2021.
//

import UIKit

class ChartGraphView: UIView {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var data = [10, 78, 98, 30, 2, 20, 50, 45, 71, 140, 100, 10, 5, 60, 50, 110, 120]
    
    func configCollectionView() {
        collectionView.registerCell(type: ChartGraphViewCell.self)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}

extension ChartGraphView: UICollectionViewDelegate {
    
}

extension ChartGraphView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueCell(type: ChartGraphViewCell.self, indexPath: indexPath) else {
            return UICollectionViewCell()
        }
        
        cell.configUI(height: CGFloat(data[indexPath.row]))
        return cell
    }
}

extension ChartGraphView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width / 15, height: self.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}
