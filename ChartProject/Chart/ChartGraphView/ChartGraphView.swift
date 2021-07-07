//
//  ChartGraphView.swift
//  ChartProject
//
//  Created by Manh Nguyen Ngoc on 07/07/2021.
//

import UIKit

class ChartGraphView: UIView {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var data = [140, 12, 90, 80, 67, 40, 100]
    
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
        return CGSize(width: (collectionView.frame.width - 6 * 5) / 7, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
