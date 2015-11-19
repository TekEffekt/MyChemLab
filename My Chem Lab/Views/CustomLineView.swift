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
        xAxis.enabled = false
        legend.enabled = true
        drawBordersEnabled = false
        drawMarkers = false
        backgroundColor = UIColor.clearColor()
        drawGridBackgroundEnabled = false
        dragEnabled = false
        leftAxis.axisLineWidth = 0
        leftAxis.labelTextColor = UIColor.blackColor().colorWithAlphaComponent(0.6)
        leftAxis.gridColor = UIColor.blackColor().colorWithAlphaComponent(0.6)
        leftAxis.valueFormatter = NSNumberFormatter()
        leftAxis.valueFormatter!.maximumFractionDigits = 1;
    }
    
    func addDataToChart()
    {
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
        dataSet.colors = ChartColorTemplates.vordiplom()
        dataSet.highlightColor = UIColor.whiteColor()
        let data = LineChartData(xVals: values, dataSet: dataSet)
        self.data = data

    }
}
