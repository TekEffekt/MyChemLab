//
//  SimulationInputsViewController.swift
//  My Chem Lab
//
//  Created by Kyle Zawacki on 10/24/15.
//  Copyright © 2015 University Of Wisconsin Parkside. All rights reserved.
//

import UIKit

class SimulationInputsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    // MARK: Properties
    @IBOutlet weak var inputsTable: UITableView!
    var simulation:Simulation?
    var waitOverlay:UIViewController?
    
    // MARK: Initialization
    
    override func viewDidLoad() {
        self.inputsTable.delegate = self
        self.inputsTable.dataSource = self
        
        self.edgesForExtendedLayout = UIRectEdge.None
    }
    
    // MARK: Tableview Datasource
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if(indexPath.section == simulation!.inputs.count)
        {
            let cell = inputsTable.dequeueReusableCellWithIdentifier("submitCell") as! SubmitTableViewCell
            cell.masterController = self
            cell.separatorInset = UIEdgeInsetsMake(0, cell.bounds.size.width, 0, 0)
            return cell
        } else
        {
            let cell = inputsTable.dequeueReusableCellWithIdentifier("inputCell") as! InputsTableViewCell
            let inputName = simulation!.inputs[indexPath.section]
            let minMax = simulation!.minMaxValues[inputName]
            cell.minValue = minMax!.0
            cell.maxValue = minMax!.1
            cell.inputName = inputName
            cell.masterController = self
            
            return cell
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return simulation!.inputs.count + 1
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == simulation!.inputs.count
        {
            return ""
        }
        
        let inputName = simulation!.inputs[section]
        let amount = simulation!.valuesForInputs[inputName]!
        return "\(simulation!.inputs[section]): \(amount) moles"
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == simulation!.inputs.count
        {
            return 55
        } else
        {
            return 50
        }
    }
    
    // MARK: Simulation
    
    func sliderValueChanged(withInput inputName:String, newValue value:Int)
    {
        simulation!.valuesForInputs[inputName] = value
        simulation!.updateInputWithValue(value: value, andInputName: inputName)
        
        self.inputsTable.reloadData()
    }
    
    func submitPressed()
    {        
        waitOverlay = self.storyboard!.instantiateViewControllerWithIdentifier("WaitOverlay")
        
        self.providesPresentationContextTransitionStyle = true;
        self.definesPresentationContext = true;
        waitOverlay!.modalPresentationStyle = UIModalPresentationStyle.OverCurrentContext
        
        self.presentViewController(waitOverlay!, animated: false) { () -> Void in
            self.createSimulationThread()
        }
    }
    
    func createSimulationThread()
    {
        let queue = NSOperationQueue()
        queue.addOperationWithBlock { () -> Void in
            self.simulation!.computeResult()
            
            NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                self.performSegueWithIdentifier("showSimulationResults", sender: self)
            })
        }
    }
    
    // MARK: Navigation
    @IBAction func closeController(sender: UIBarButtonItem)
    {
        if let _ = waitOverlay
        {
            waitOverlay!.dismissViewControllerAnimated(false, completion: nil)
        }
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        let resultsController = segue.destinationViewController as! ResultsViewController
        resultsController.simulationResults = simulation!.getResult()
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        if let _ = waitOverlay
        {
            waitOverlay!.dismissViewControllerAnimated(false, completion: nil)
        }
    }
    
}
