//
//  CustomBarChartView.swift
//  
//
//  Created by Kyle Zawacki on 11/11/15.
//
//

import UIKit
import Charts

class CustomBarChartView: BarChartView
{
    var simulationResults:[String:Float]?
    
    init(frame: CGRect, simResults:[String:Float])
    {
        super.init(frame: frame)
        
        simulationResults = simResults
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
        drawBordersEnabled = false
        drawMarkers = false
        backgroundColor = UIColor.clearColor()
        drawGridBackgroundEnabled = false
        dragEnabled = false
        leftAxis.axisLineWidth = 0
        leftAxis.labelTextColor = UIColor.blackColor().colorWithAlphaComponent(0.6)
        leftAxis.gridColor = UIColor.blackColor().colorWithAlphaComponent(0.6)
        drawValueAboveBarEnabled = false
        maxVisibleValueCount = 60
        pinchZoomEnabled = false
        drawBarShadowEnabled = false
        xAxis.labelPosition = ChartXAxis.XAxisLabelPosition.Bottom
        xAxis.spaceBetweenLabels = 0;
        xAxis.drawGridLinesEnabled = false;
        
        legend.enabled = false
    }
    
    func addDataToChart()
    {
        var yVals:[BarChartDataEntry] = []
        var xVals:[String] = []
        
        var count = 0
        for (key,value) in self.simulationResults!
        {
            count++;
            yVals.append(BarChartDataEntry(value: Double(Int(value)), xIndex: count))
            xVals.append(key)
        }
        
        let dataset = BarChartDataSet(yVals: yVals)
        dataset.colors = ChartColorTemplates.vordiplom()
        let outputData = BarChartData(xVals: xVals, dataSet: dataset)
        outputData.setDrawValues(false)
        
        print(yVals)
        
        
        data = outputData
    }
    
    
}
