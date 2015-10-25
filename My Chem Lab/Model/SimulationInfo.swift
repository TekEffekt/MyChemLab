//
//  SimulationInfo.swift
//  My Chem Lab
//
//  Created by Kyle Zawacki on 10/24/15.
//  Copyright © 2015 University Of Wisconsin Parkside. All rights reserved.
//

import UIKit

class SimulationInfo: NSObject
{
    static let simulationNames = ["Biodiesel", "Water","Hydrocholoric Acid","My Plasma"]
    static let inputs = ["Biodiesel":["Methanol","Temperature","Catalyst","Oil","Mixing Length","Settling Time"]]
    static let outputs = ["Biodiesel":["Biodiesel","Conversion Ratio"]]
    
    static let minMaxValues = ["Biodiesel":["Methanol":(0,50),"Temperature":(20,60),"Catalyst":(1,10),"Oil":(5,15),"Mixing Length":(0,30),"Settling Time":(1,30)]]
    
    static func getSimulationInputs(simName name:String) -> [String]
    {
        return inputs[name]!
    }
    
    static func getSimulationOutputs(simName name:String) -> [String]
    {
        return outputs[name]!
    }
    
    static func getMinMaxValuesForSimType(simName:String) -> [String:(Int,Int)]
    {
        return minMaxValues[simName]!
    }
}
