//
//  PieChartCard.swift
//  My Chem Lab
//
//  Created by Kyle Zawacki on 10/28/15.
//  Copyright © 2015 University Of Wisconsin Parkside. All rights reserved.
//

import UIKit
import Charts

class PieChartCard: UICollectionViewCell
{
    @IBOutlet weak var cardContainer: UIView!
    var pieChart:PieChartView?
    var conversionRatio:Int?
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        self.addCard()
        setupChart()
        addDataToChart()
    }
    
    func addCard()
    {
        let card = CardView(frame: cardContainer.frame)
        card.backgroundColor = UIColor(red:0.98, green:0.98, blue:0.98, alpha:1.0)
        
        self.addSubview(card)
    }
    
    func setupChart()
    {
        pieChart = PieChartView(frame: self.frame)
        pieChart!.usePercentValuesEnabled = true
        pieChart!.descriptionText = ""
        pieChart!.holeRadiusPercent = 0
        pieChart!.holeTransparent = false
        pieChart!.holeAlpha = 0
        pieChart!.legend.position = ChartLegend.ChartLegendPosition.LeftOfChart
        pieChart!.rotationEnabled = false
        
        pieChart!.animate(xAxisDuration: 1.4, yAxisDuration: 1.4, easingOption: ChartEasingOption.EaseOutCirc)
        
        self.addSubview(pieChart!)
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
        dataset.colors =  ChartColorTemplates.joyful()
        dataset.label = ""
        
        let formatter = NSNumberFormatter()
        formatter.numberStyle = NSNumberFormatterStyle.PercentStyle
        formatter.percentSymbol = "%"
        formatter.multiplier = 1
        dataset.valueFormatter = formatter
        
        let pieData = PieChartData(xVals: ["Biodiesel", "Waste"], dataSet: dataset)
        
        print("\(yVals)")
        
        pieChart!.data = pieData
    }
}
