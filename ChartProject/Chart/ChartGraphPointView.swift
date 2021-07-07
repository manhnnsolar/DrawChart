//
//  ChartGraphPointView.swift
//  ChartProject
//
//  Created by Manh Nguyen Ngoc on 07/07/2021.
//

import UIKit

private struct Const {
    static let leftColumnContentSize: CGFloat = 53
    static let contentInset = UIEdgeInsets(top: 20, left: 53, bottom: 20, right: 20)
} 

class ChartGraphPointView: UIView {
    override func draw(_ rect: CGRect) {
        let levels = [140, 12, 90, 80, 67, 40, 100]
        let contentSize = rect.inset(by: Const.contentInset)
        let leftInset = (contentSize.width - 6 * 5) / 7 / 2 // tru di 6 space roi chia 7 , chia doi cot ra
        let widthInit = (contentSize.width - (contentSize.width - 6 * 5) / 7) / 6 //tru di 1 cot roi chia 6
        
        for levelIndex in 0..<levels.count {
            let path = UIBezierPath(ovalIn: CGRect(x: 53 + -3.5 + leftInset + widthInit * CGFloat(levelIndex), y: self.frame.height - 20 - 3.5 - CGFloat(levels[levelIndex]), width: 7, height: 7))
            UIColor.red.setFill()
            path.fill()
            
            path.lineWidth = 1
            UIColor.white.setStroke()
            path.stroke()
        }
        
    }
}
