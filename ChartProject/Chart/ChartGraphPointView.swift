//
//  ChartGraphPointView.swift
//  ChartProject
//
//  Created by Manh Nguyen Ngoc on 07/07/2021.
//

import UIKit

private struct Const {
    static let leftColumnContentSize: CGFloat = 53
    static let contentInset = UIEdgeInsets(top: 20, left: 53, bottom: 20, right: 53)
} 

class ChartGraphPointView: UIView {
    override func draw(_ rect: CGRect) {
        var listPoint = [CGPoint]()
        
        let levels = [140.0, 12.0, 90.0, 80.0, 67.0, 40.0, 100.0]
        let contentSize = rect.inset(by: Const.contentInset)
        let leftInset = (contentSize.width - 6 * 5) / 7 / 2 // tru di 6 space roi chia 7 , chia doi cot ra
        let widthInit = (contentSize.width - (contentSize.width - 6 * 5) / 7) / 6 //tru di 1 cot roi chia 6
        let heightInit = contentSize.height + 20 - 3.5
        
        // MARK: - Draw point
        for levelIndex in 0..<levels.count {
            let x = 53 + -3.5 + leftInset + widthInit * CGFloat(levelIndex)
            let y = heightInit - contentSize.height * CGFloat(levels[levelIndex]) / 140.0
            let path = UIBezierPath(ovalIn: CGRect(x: x, y: y, width: 7, height: 7))
            listPoint.append(CGPoint(x: x, y: y))
            
            UIColor(rgb: 0xB52423).setFill()
            path.fill()
            
            path.lineWidth = 1
            UIColor.white.setStroke()
            path.stroke()
        }
        
        // MARK: - Draw line
        for index in 0..<listPoint.count - 1 {
            let path = UIBezierPath()
            path.lineWidth = 2
            path.move(to: CGPoint(x: listPoint[index].x + 3.5, y: listPoint[index].y + 3.5))
            path.addLine(to: CGPoint(x: listPoint[index + 1].x + 3.5, y: listPoint[index + 1].y + 3.5))
            UIColor(rgb: 0xB52423).setStroke()
            path.stroke()
        }
    }
}
