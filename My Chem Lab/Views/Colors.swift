//
//  Colors.swift
//  My Chem Lab
//
//  Created by Kyle Zawacki on 11/19/15.
//  Copyright © 2015 University Of Wisconsin Parkside. All rights reserved.
//

import UIKit

enum Colors
{
    case LineChart
    case BarChart
    case PieChart
    case TintColor
    
    func getChartColors() -> [UIColor]?
    {
        switch self
        {
            case .LineChart:
                return [UIColor(red:0.00, green:0.75, blue:0.23, alpha:1.0)]
            case .PieChart:
                return [UIColor(red:0.11, green:0.73, blue:0.33, alpha:1.0), UIColor(red:0.83, green:0.18, blue:0.18, alpha:1.0)]
            case .BarChart:
                return []
            default:
                return nil
        }
    }
    
    func getColor() -> UIColor?
    {
        switch self
        {
            case .TintColor:
                return UIColor(red:0.11, green:0.73, blue:0.33, alpha:1.0)
            default:
                return nil
        }
    }
    
    func getCardColor() -> UIColor?
    {
        switch self
        {
        case .LineChart:
            return UIColor.redColor()
        case .PieChart:
            return UIColor(red:0.98, green:0.41, blue:0.41, alpha:1.0)
        case .BarChart:
            return UIColor.blackColor()
        default:
            return nil
        }
    }
    
}