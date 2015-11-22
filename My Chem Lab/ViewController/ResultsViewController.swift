//
//  ResultsViewController.swift
//  My Chem Lab
//
//  Created by Kyle Zawacki on 10/27/15.
//  Copyright © 2015 University Of Wisconsin Parkside. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController
{
    // MARK: Properties
    @IBOutlet weak var chartContainer: UIView!
    var simulationResults:[String:Float]?
    
    // MARK: Initialization
    override func viewDidLoad() {
        print(self.chartContainer.subviews)
        self.navigationItem.hidesBackButton = true
    }
    
    override func viewWillAppear(animated: Bool) {
        let backToButton = UIBarButtonItem(title: "Restart", style: UIBarButtonItemStyle.Plain, target: self, action: "backToSimOptions")
        
        self.navigationItem.leftBarButtonItem = backToButton
        self.setupNavBar()
    }
    
    func setupNavBar()
    {
        self.navigationItem.title = "Results & Stats"
        self.navigationController!.navigationBar.hideBottomHairline()
    }
    
    // MARK: Navigation
    
    func backToSimOptions()
    {
        let transitionOveraly = UIView(frame: CGRectMake(0, 0, self.view.frame.width, self.view.frame.height*2))
        transitionOveraly.backgroundColor = UIColor.blackColor()
        transitionOveraly.alpha = 0.0
        
        self.navigationController!.view.addSubview(transitionOveraly)
        
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            transitionOveraly.alpha = 1.0
            }, completion: {(Bool) -> Void in
                self.performSegueWithIdentifier("BackToSimOptions", sender: self)
        })
    }
    
    
}
