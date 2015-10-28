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
    var result:[String:Float]?
    
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
    
    func computeResult()
    {
        let simulation = TheSimulation()
        let oil = Float(valuesForInputs["Oil"]!)
        let methanol = Float(valuesForInputs["Methanol"]!)
        let cataylyst = Float(valuesForInputs["Catalyst"]!)
        let temperature = Float(valuesForInputs["Temperature"]!)
        let mixingLength = Float(valuesForInputs["Mixing Length"]!)
        let settlingTime = Float(valuesForInputs["Settling Time"]!)
        
        simulation.initDataWith(oil, methanol: methanol, catalyst: cataylyst, temperature: temperature, mixingLength: mixingLength, andSettlingTime: settlingTime)
        simulation.setup()
        
        var simulationNotDone = true
        
        while(simulationNotDone)
        {
            simulationNotDone = simulation.loop()
            print("Simulating")
        }
        
        print(simulation.Convout)
        
        result = ["TGout": simulation.TGout, "DGout": simulation.DGout, "Eout": simulation.Eout, "Convout": simulation.Convout * 100]
        print(result)
    }
    
    func getResult() -> [String:Float]
    {
        return result!
    }
    
}
