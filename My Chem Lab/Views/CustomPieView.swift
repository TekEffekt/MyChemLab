//
//  CustomPieView.swift
//  My Chem Lab
//
//  Created by Kyle Zawacki on 11/9/15.
//  Copyright © 2015 University Of Wisconsin Parkside. All rights reserved.
//

import UIKit
import Charts

class CustomPieView: PieChartView
{
    var conversionRatio:Int?
    
    init(frame: CGRect, conversionRatio:Int)
    {
        super.init(frame: frame)
        
        self.conversionRatio = conversionRatio
        self.setupChart()
        self.addDataToChart()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupChart()
    {
        usePercentValuesEnabled = true
        descriptionText = ""
//        holeTransparent = true
//        holeAlpha = 1
        holeRadiusPercent = 0.4
        transparentCircleRadiusPercent = 0.45
        holeColor = UIColor.clearColor()
        legend.position = ChartLegend.ChartLegendPosition.LeftOfChart
        legend.textColor = UIColor.whiteColor()
        legend.font = legend.font.fontWithSize(12)
        rotationEnabled = false
        
        
        animate(xAxisDuration: 1.4, yAxisDuration: 1.4, easingOption: ChartEasingOption.EaseOutCirc)
    }
    
    func addDataToChart()
    {
        var yVals:[BarChartDataEntry] = []
        
        let data:[Double] = [Double(conversionRatio!),Double(100-conversionRatio!)]
        
        for n in data
        {
            yVals.append(BarChartDataEntry(value: n, xIndex: data.indexOf(n)!))
        }
        
        let dataset = PieChartDataSet(yVals: yVals)
        dataset.sliceSpace = 2.0
        dataset.colors = Colors.PieChart.getChartColors()!
        dataset.label = ""

        let formatter = NSNumberFormatter()
        formatter.numberStyle = NSNumberFormatterStyle.PercentStyle
        formatter.percentSymbol = "%"
        formatter.multiplier = 1
        dataset.valueFormatter = formatter
        
        let pieData = PieChartData(xVals: ["Biodiesel", "Waste"], dataSet: dataset)
        
        pieData.setValueTextColor(UIColor.whiteColor())
        pieData.setValueFont(UIFont(name: "Helvetica Neue", size: 18.5))
        
        self.data = pieData
    }
    
}
