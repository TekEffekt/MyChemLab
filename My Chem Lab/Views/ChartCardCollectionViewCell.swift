//
//  ChartCardCollectionViewCell.swift
//  My Chem Lab
//
//  Created by Kyle Zawacki on 11/8/15.
//  Copyright © 2015 University Of Wisconsin Parkside. All rights reserved.
//

import UIKit
import Charts

class ChartCardCollectionViewCell: UICollectionViewCell
{
    @IBOutlet weak var cardContainer: UIView!
    var chartView:ChartViewBase?
    var simulationResults:[String: Float]?
    var chartType:ChartTypes = ChartTypes.EfficiencyPieChart
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        self.addCard()
        setupChartView()
    }
    
    func addCard()
    {
        let card = CardView(frame: cardContainer.frame)
        card.backgroundColor = UIColor(red:0.98, green:0.98, blue:0.98, alpha:1.0)
        
        self.addSubview(card)
    }
    
    func setupChartView()
    {
        switch chartType
        {
        case .EfficiencyPieChart:
             chartView = CustomPieView(frame: cardContainer.frame, conversionRatio: Int(simulationResults!["Convout"]!))
        case .PreviousSimsLineChart:
            chartView = CustomLineView(frame: cardContainer.frame)
        case .OutputsBarChart:
            chartView = CustomBarChartView(frame: cardContainer.frame, simResults: simulationResults!)
        }
        
        addSubview(chartView!)
    }
    
}
