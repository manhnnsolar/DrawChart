//
//  ChartView.swift
//  ChartProject
//
//  Created by Manh Nguyen Ngoc on 07/07/2021.
//

import UIKit

class ChartView: UIView {
    
    var guideline: ChartGuidelineView!
    var chartGraphView: ChartGraphView!
    var chartGraphPointView: ChartGraphPointView!
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
        initChartGraphView()
        initChartGraphPointView()
    }
    
    private func initChartGraphView() {
        self.chartGraphView = Bundle.main.loadNibNamed("ChartGraphView", owner: self, options: nil)?.first as? ChartGraphView
        self.chartGraphView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(chartGraphView)
        self.chartGraphView.fitSuperviewConstraint()
        self.chartGraphView.configCollectionView()
    }
    
    private func initChartGraphPointView() {
        self.chartGraphPointView = ChartGraphPointView()
        self.chartGraphPointView.backgroundColor = .clear
        self.chartGraphPointView.isUserInteractionEnabled = false
        self.addSubview(self.chartGraphPointView)
        self.chartGraphPointView.fitSuperviewConstraint()
    }
    
    private func initContentView() {
        self.contentView = UIView()
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.contentView)
    }
    
    private func initGuideLine() {
        self.guideline = ChartGuidelineView()
        self.guideline.backgroundColor = .clear
        self.guideline.isUserInteractionEnabled = false
        self.addSubview(self.guideline)
        self.guideline.fitSuperviewConstraint()
    }
}
