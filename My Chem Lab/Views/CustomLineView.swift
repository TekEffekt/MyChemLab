//
//  CustomLineView.swift
//  My Chem Lab
//
//  Created by Kyle Zawacki on 11/11/15.
//  Copyright © 2015 University Of Wisconsin Parkside. All rights reserved.
//

import UIKit
import Charts

class CustomLineView: LineChartView
{
    var previousSimValues:[Double]?
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        
        self.setupChart()
        self.addDataToChart()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupChart()
    {
        descriptionText = ""
        rightAxis.enabled = false
        xAxis.enabled = true
        legend.enabled = false
        drawBordersEnabled = false
        drawMarkers = false
        backgroundColor = UIColor.clearColor()
        drawGridBackgroundEnabled = false
        dragEnabled = false
        leftAxis.axisLineWidth = 0
        leftAxis.labelTextColor = UIColor.blackColor().colorWithAlphaComponent(0.9)
        leftAxis.gridColor = UIColor.blackColor().colorWithAlphaComponent(0.9)
        leftAxis.valueFormatter = NSNumberFormatter()
        leftAxis.valueFormatter!.maximumFractionDigits = 1;
        xAxis.labelTextColor = xAxis.labelTextColor.colorWithAlphaComponent(0.9)
//        xAxis.drawGridLinesEnabled = false
        xAxis.labelPosition = ChartXAxis.XAxisLabelPosition.Bottom
    }
    
    func addDataToChart()
    {
        let values:[Double] = NSUserDefaults.standardUserDefaults().valueForKey("Previous Sim Values") as! [Double]
        var dataEntries:[ChartDataEntry] = []
        var xVals:[String] = []
        var count = values.count
        
        for entry in values
        {
            dataEntries.append(ChartDataEntry(value: entry, xIndex: values.indexOf(entry)!))
            if count == 1
            {
                xVals.append("Recent")
            } else
            {
                xVals.append("\(count)")
            }
            
            count--
        }
        
        let dataSet = LineChartDataSet(yVals: dataEntries)
        dataSet.drawValuesEnabled = false
        dataSet.circleRadius = 0.0
        dataSet.lineWidth = 2.5
        dataSet.colors = [Colors.TintColor.getColor()!]
        dataSet.highlightColor = UIColor.whiteColor()
        dataSet.label = "Last Simulations"
        let data = LineChartData(xVals: xVals, dataSet: dataSet)
        self.data = data
    }
    
    
}
