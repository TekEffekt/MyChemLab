//
//  PieChartViewController.swift
//  My Chem Lab
//
//  Created by Kyle Zawacki on 11/22/15.
//  Copyright © 2015 University Of Wisconsin Parkside. All rights reserved.
//

import UIKit
import Charts

class PieChartViewController: UIViewController
{
    var chartView:ChartViewBase?
    @IBOutlet weak var chartContainer: UIView!
    
    override func viewDidAppear(animated: Bool) {
        chartView = CustomPieView(frame: CGRectMake(0, 0, chartContainer.frame.width-60, chartContainer.frame.height-60), conversionRatio: 69)
        chartView!.center = chartContainer.center
        self.chartContainer.addSubview(chartView!)
    }
    
}
