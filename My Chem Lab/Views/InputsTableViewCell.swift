//
//  InputsTableViewCell.swift
//  My Chem Lab
//
//  Created by Kyle Zawacki on 10/24/15.
//  Copyright © 2015 University Of Wisconsin Parkside. All rights reserved.
//

import UIKit

class InputsTableViewCell: UITableViewCell
{
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    
    @IBOutlet weak var slider: UISlider!
    
    var masterController:SimulationInputsViewController?
    
    var minValue:Int?
    var maxValue:Int?
    var inputName:String?
    
    override func drawRect(rect: CGRect) {
        self.slider.minimumValue = Float(minValue!)
        self.slider.maximumValue = Float(maxValue!)
    }
    
    @IBAction func inputValueChanged(sender: UISlider)
    {
        masterController!.sliderValueChanged(withInput: inputName!, newValue: Int(sender.value))
    }
    
}
