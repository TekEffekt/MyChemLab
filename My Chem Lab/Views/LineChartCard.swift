//
//  LineChartCard.swift
//  My Chem Lab
//
//  Created by Kyle Zawacki on 10/28/15.
//  Copyright © 2015 University Of Wisconsin Parkside. All rights reserved.
//

import UIKit
import Charts

class LineChartCard: UICollectionViewCell
{
    var lineChart:LineChartView?
    @IBOutlet weak var cardContainer: UIView!
    
    override func drawRect(rect: CGRect) {
        addCard()
        setupChart()
    }
    
    func addCard()
    {
        let card = CardView(frame: cardContainer.frame)
        card.backgroundColor = UIColor(red:0.98, green:0.98, blue:0.98, alpha:1.0)
        
        self.addSubview(card)
    }
    
    func setupChart()
    {
        lineChart = LineChartView()
        lineChart!.descriptionText = ""
        lineChart!.rightAxis.enabled = false
        lineChart!.xAxis.enabled = false
        lineChart!.legend.enabled = true
        lineChart!.drawBordersEnabled = false
        lineChart!.drawMarkers = false
        lineChart!.backgroundColor = UIColor.clearColor()
        lineChart!.drawGridBackgroundEnabled = false
        lineChart!.dragEnabled = false
        lineChart!.leftAxis.axisLineWidth = 0
        lineChart!.leftAxis.labelTextColor = UIColor.blackColor().colorWithAlphaComponent(0.6)
        lineChart!.leftAxis.gridColor = UIColor.blackColor().colorWithAlphaComponent(0.6)
        lineChart!.leftAxis.valueFormatter = NSNumberFormatter()
        lineChart!.leftAxis.valueFormatter!.maximumFractionDigits = 1;
        
        let values:[Double] = [10,20,15,30,4,70]
        var dataEntries:[ChartDataEntry] = []
        
        for entry in values
        {
            dataEntries.append(ChartDataEntry(value: entry, xIndex: values.indexOf(entry)!))
        }
        
        let dataSet = LineChartDataSet(yVals: dataEntries)
        dataSet.drawValuesEnabled = false
        dataSet.circleRadius = 0.0
        dataSet.lineWidth = 2.0
        dataSet.colors = [UIColor(red:0.00, green:0.75, blue:0.23, alpha:1.0)]
        dataSet.highlightColor = UIColor.whiteColor()
        let data = LineChartData(xVals: values, dataSet: dataSet)
        lineChart!.data = data
        
        self.addSubview(lineChart!)
        print("what")
    }
}
