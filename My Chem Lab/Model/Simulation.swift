//
//  Simulation.swift
//  My Chem Lab
//
//  Created by Kyle Zawacki on 10/24/15.
//  Copyright © 2015 University Of Wisconsin Parkside. All rights reserved.
//

import UIKit

class Simulation
{
    let name:String
    let inputs:[String]
    let outputs:[String]
    let minMaxValues:[String:(Int,Int)]
    
    var valuesForInputs:[String:Int]
    
    init(withSimulationName name:String)
    {
        self.name = name
        self.inputs = SimulationInfo.getSimulationInputs(simName: name)
        self.outputs = SimulationInfo.getSimulationOutputs(simName: name)
        self.minMaxValues = SimulationInfo.getMinMaxValuesForSimType(name)
        
        self.valuesForInputs = [String:Int]()
        setupValueDictionaryWithInputs()
    }
    
    func setupValueDictionaryWithInputs()
    {
        for input in inputs
        {
            valuesForInputs[input] = minMaxValues[input]!.0
        }
    }
    
    func updateInputWithValue(value value:Int, andInputName name:String)
    {
        valuesForInputs[name] = value
    }
    
}
