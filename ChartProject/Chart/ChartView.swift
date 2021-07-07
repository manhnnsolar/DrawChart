//
//  ChartView.swift
//  ChartProject
//
//  Created by Manh Nguyen Ngoc on 07/07/2021.
//

import UIKit

class ChartView: UIView {
    
    var guideline: ChartGuidelineView!
    var contentView: UIView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        configViews()
    }
    
    private func configViews() {
        initGuideLine()
        initContentView()
    }
    
    private func initContentView() {
        self.contentView = UIView()
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.contentView)
        
//        NSLayoutConstraint.activate([
//            self.scrollView.leadingAnchor.constraint(equalTo: self.graph.leadingAnchor),
//            self.scrollView.trailingAnchor.constraint(equalTo: self.graph.trailingAnchor, constant: -ChartGraphView.Const.insetRight),
//            self.scrollView.topAnchor.constraint(equalTo: self.graph.topAnchor),
//            self.scrollView.bottomAnchor.constraint(equalTo: self.graph.bottomAnchor)
//        ])
    }
    
    private func initGuideLine() {
        self.guideline = ChartGuidelineView()
        self.guideline.backgroundColor = .clear
        self.guideline.isUserInteractionEnabled = false
        self.addSubview(self.guideline)
        self.guideline.fitSuperviewConstraint()
    }
}
