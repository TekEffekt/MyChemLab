//
//  MyLabViewController.swift
//  My Chem Lab
//
//  Created by Kyle Zawacki on 10/19/15.
//  Copyright © 2015 University Of Wisconsin Parkside. All rights reserved.
//

import UIKit

class MyLabViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    // MARK: Properties
    @IBOutlet weak var simulationOptionTableView: UITableView!
    let blackness:UIView = UIView()
    
    // MARK: Initializaiton
    override func viewDidLoad() {
        self.simulationOptionTableView.delegate = self
        self.simulationOptionTableView.dataSource = self
        self.navigationController!.navigationBarHidden = false
        
        self.blackness.frame = CGRectMake(0, 0, self.view.frame.width,
            self.navigationController!.view.frame.height + self.view.frame.height)
        self.blackness.backgroundColor = UIColor.blackColor()
        self.navigationController!.view.addSubview(blackness)
    }
    
    override func viewWillAppear(animated: Bool) {
        setupNavBar()
    }
    
    override func viewDidAppear(animated: Bool) {
        if let _ = blackness.superview
        {
            UIView.animateWithDuration(1.0, animations: { () -> Void in
                self.blackness.alpha = 0.0
                }) { (Bool) -> Void in
                    self.blackness.removeFromSuperview()
            }
        }
    }
    
    func setupNavBar()
    {
        self.tabBarController!.navigationItem.title = "Choose A Simulation"
        let plus = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: nil)
        self.tabBarController!.navigationItem.rightBarButtonItem = plus
    }
    
    // MARK: TableView Datasource
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = simulationOptionTableView.dequeueReusableCellWithIdentifier("simulationOption") as! SimulationOptionCell
        cell.index = indexPath.row
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    // MARK: Tableview Delegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("Show Inputs", sender: self)
    }
    
    // MARK: Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let navController = segue.destinationViewController as! UINavigationController
        let inputController = navController.viewControllers.first as! SimulationInputsViewController
        inputController.simulation = Simulation(withSimulationName: "Biodiesel")
    }
    
}
