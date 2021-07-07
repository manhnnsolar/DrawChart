//
//  ChartGuidelineView.swift
//  ChartProject
//
//  Created by Manh Nguyen Ngoc on 07/07/2021.
//

import UIKit

private struct Const {
    static let leftColumnContentSize: CGFloat = 43
    static let contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 25, right: 0)
}

class ChartGuidelineView: UIView {
    override func draw(_ rect: CGRect) {
        let levels = [140, 120, 100, 80, 60, 40, 20, 0]
        let contentSize = rect.inset(by: Const.contentInset)
        
        for levelIndex in 0..<levels.count {
            let baseLineY = Const.contentInset.top + CGFloat(levelIndex) * contentSize.height/CGFloat(levels.count - 1)
            
            let guideTextHeight: CGFloat = 16
            let theoryTextSize = CGSize(width: Const.leftColumnContentSize, height: guideTextHeight)
            let text = "\(levels[levelIndex])"
            
            let font = UIFont.systemFont(ofSize: 12)
            let att = NSMutableAttributedString(string: text)
            let textSize = att.boundingRect(with: theoryTextSize, options: [], context: nil).size
            
            let textRect = CGRect(x: theoryTextSize.width - textSize.width,
                                  y: baseLineY - guideTextHeight + (theoryTextSize.height - textSize.height),
                                  width: textSize.width,
                                  height: textSize.height)
            att.draw(in: textRect)
            
            // Draw line
            let path = UIBezierPath()
            if levels[levelIndex] != 0 {
                path.setLineDash([3,3], count: 2, phase: 0)
            }
            
            path.lineWidth = 0.5
            path.move(to: CGPoint(x: theoryTextSize.width, y: baseLineY))
            path.addLine(to: CGPoint(x: contentSize.width - 17, y: baseLineY))
            UIColor(rgb: 0x6C6C6C).setStroke()
            path.stroke()
        }
    }
}

