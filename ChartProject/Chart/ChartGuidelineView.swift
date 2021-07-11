//
//  ChartGuidelineView.swift
//  ChartProject
//
//  Created by Manh Nguyen Ngoc on 07/07/2021.
//

import UIKit

private struct Const {
    static let leftColumnContentSize: CGFloat = 43
    static let contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
}

class ChartGuidelineView: UIView {
    override func draw(_ rect: CGRect) {
        let levels = ["sec", 140, 120, 100, 80, 60, 40, 20, 0] as [Any]
        let contentSize = rect.inset(by: Const.contentInset)
        
        for levelIndex in 0..<levels.count {
            let baseLineY = Const.contentInset.top + CGFloat(levelIndex) * contentSize.height/CGFloat(levels.count - 1)
            
            // MARK: - text left
            let guideTextHeight: CGFloat = 16
            let theoryTextSize = CGSize(width: Const.leftColumnContentSize, height: guideTextHeight)
            let text = "\(levels[levelIndex])"
            
            let font = UIFont.systemFont(ofSize: 12)
            let att = NSMutableAttributedString(string: text)
            let textSize = att.boundingRect(with: theoryTextSize, options: [], context: nil).size
            
            let textRect = CGRect(x: theoryTextSize.width - textSize.width - 10,
                                  y: baseLineY - guideTextHeight + (theoryTextSize.height - textSize.height),
                                  width: textSize.width,
                                  height: textSize.height)
            att.draw(in: textRect)
            
            // MARK: - right text
            let textRect2 = CGRect(x: self.frame.width - theoryTextSize.width + 10,
                                  y: baseLineY - guideTextHeight + (theoryTextSize.height - textSize.height),
                                  width: textSize.width,
                                  height: textSize.height)
            att.draw(in: textRect2)
            
            // MARK: - Draw line
            if levelIndex == 0 || levelIndex == levels.count - 1 {
                let path = UIBezierPath()
                path.setLineDash([2, 2], count: 2, phase: 0)
                
                path.lineWidth = 0.5
                path.move(to: CGPoint(x: 0, y: baseLineY))
                path.addLine(to: CGPoint(x: contentSize.width, y: baseLineY))
                UIColor(rgb: 0x8B8B8B).setStroke()
                path.stroke()
            }
        }
        
        // MARK: - Draw column left
        let guideTextHeight: CGFloat = 16
        let theoryTextSize = CGSize(width: Const.leftColumnContentSize, height: guideTextHeight)
        let baseLineY = Const.contentInset.top
        let path = UIBezierPath()
        path.setLineDash([2, 2], count: 2, phase: 0)
        path.lineWidth = 0.5
        path.move(to: CGPoint(x: theoryTextSize.width, y: baseLineY))
        path.addLine(to: CGPoint(x: theoryTextSize.width, y: baseLineY + CGFloat(levels.count - 1) * contentSize.height/CGFloat(levels.count - 1)))
        UIColor(rgb: 0x8B8B8B).setStroke()
        path.stroke()
        
        // MARK: - Draw column right
        path.move(to: CGPoint(x: contentSize.width - theoryTextSize.width, y: baseLineY))
        path.addLine(to: CGPoint(x: contentSize.width - theoryTextSize.width, y: baseLineY + CGFloat(levels.count - 1) * contentSize.height/CGFloat(levels.count - 1)))
        UIColor(rgb: 0x8B8B8B).setStroke()
        path.stroke()
    }
}

