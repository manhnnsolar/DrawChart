//
//  ChartGraphViewCell.swift
//  ChartProject
//
//  Created by Manh Nguyen Ngoc on 07/07/2021.
//

import UIKit

class ChartGraphViewCell: UICollectionViewCell {

    @IBOutlet weak var ColumnView: UIView!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configUI(height: CGFloat) {
        heightConstraint.constant = height / 140 * self.frame.height * (7 / 8)
        valueLabel.text = "\(Int(height))"
    }

}
