//
//  SubmitTableViewCell.swift
//  My Chem Lab
//
//  Created by Kyle Zawacki on 10/24/15.
//  Copyright © 2015 University Of Wisconsin Parkside. All rights reserved.
//

import UIKit

class SubmitTableViewCell: UITableViewCell
{
    var masterController:SimulationInputsViewController?
    
    @IBAction func submitPressed(sender: UIButton)
    {
        masterController!.submitPressed()
    }
}
