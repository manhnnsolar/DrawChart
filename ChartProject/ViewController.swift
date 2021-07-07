//
//  ViewController.swift
//  ChartProject
//
//  Created by Manh Nguyen Ngoc on 07/07/2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var chartView: ChartView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var collectionBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var collectionLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var collectionTrailingConstraint: NSLayoutConstraint!
    
    
    var data = [10, 78, 98, 30, 2, 20, 50, 45, 71, 140, 100, 10, 5, 60, 50, 110, 120, 10, 78, 98, 30, 2, 20, 50, 45, 71, 140, 100, 10, 5, 60, 50, 110, 120]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
    }

    func config() {
        configCollectionView()
    }
    
    func configCollectionView() {
        collectionView.registerCell(type: ChartGraphViewCell.self)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionTopConstraint.constant = 20
        collectionBottomConstraint.constant = -25
        collectionLeadingConstraint.constant = 53
        collectionTrailingConstraint.constant = -20
    }
}

extension ViewController: UICollectionViewDelegate {
    
}

extension ViewController: UICollectionViewDataSource {
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

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 20, height: self.collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

