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
    @IBOutlet weak var chartTitle: UILabel!
    @IBOutlet weak var chartContainer: UIView!
    @IBOutlet weak var cardContainer: UIView!
    var chartView:ChartViewBase?
    var simulationResults:[String: Float]?
    var chartType:ChartTypes = ChartTypes.EfficiencyPieChart
    var card:CardView?
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        self.addCard()
        setupChartView()
        
        chartTitle.text = chartType.rawValue
    }
    
    func addCard()
    {
        card = CardView(frame: cardContainer.frame)
        
        switch chartType
        {
        case .EfficiencyPieChart:
            card!.backgroundColor = Colors.PieChart.getCardColor()
        case .PreviousSimsLineChart:
            card!.backgroundColor = Colors.LineChart.getCardColor()
        case .OutputsBarChart:
            card!.backgroundColor = Colors.BarChart.getCardColor()
        }

        insertSubview(card!, atIndex: 0)
    }
    
    func setupChartView()
    {
        switch chartType
        {
        case .EfficiencyPieChart:
             chartView = CustomPieView(frame: CGRectMake(0, 0, chartContainer.frame.width, chartContainer.frame.height), conversionRatio: Int(simulationResults!["Convout"]!))
        case .PreviousSimsLineChart:
            chartView = CustomLineView(frame: CGRectMake(0, 0, chartContainer.frame.width, chartContainer.frame.height))
        case .OutputsBarChart:
            chartView = CustomBarChartView(frame: CGRectMake(0, 0, chartContainer.frame.width, chartContainer.frame.height), simResults: simulationResults!)
        }
        
        chartContainer.addSubview(chartView!)
    }
    
}
