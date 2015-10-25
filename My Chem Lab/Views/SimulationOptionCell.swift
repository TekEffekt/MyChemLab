//
//  SimulationOptionCell.swift
//  My Chem Lab
//
//  Created by Kyle Zawacki on 10/22/15.
//  Copyright © 2015 University Of Wisconsin Parkside. All rights reserved.
//

import UIKit

class SimulationOptionCell: UITableViewCell
{
    @IBOutlet weak var simulationNameLabel: UILabel!
    let simulationTestNames = ["Biodiesel", "Water", "Hydrocholoric Acid", "My Plasma"]
    var index:Int?
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect);
        
        if let _ = index
        {
            self.simulationNameLabel.text = simulationTestNames[index!]
        }
    }
}
