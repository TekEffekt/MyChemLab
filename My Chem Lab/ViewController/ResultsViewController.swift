//
//  ResultsViewController.swift
//  My Chem Lab
//
//  Created by Kyle Zawacki on 10/27/15.
//  Copyright © 2015 University Of Wisconsin Parkside. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    // MARK: Properties
    var simulationResults:[String: Float]?
    @IBOutlet weak var graphCollectionView: UICollectionView!
    
    // MARK: Initialization
    override func viewDidLoad() {
        print("\(simulationResults)")
        graphCollectionView.dataSource = self
        graphCollectionView.delegate = self
        self.edgesForExtendedLayout = UIRectEdge.None
        
        self.navigationItem.hidesBackButton = true
    }
    
    override func viewWillAppear(animated: Bool) {
        let backToButton = UIBarButtonItem(title: "Restart", style: UIBarButtonItemStyle.Plain, target: self, action: "backToSimOptions")
        
        self.navigationItem.rightBarButtonItem = backToButton
        self.setupNavBar()
    }
    
    func setupNavBar()
    {
        self.navigationItem.title = "Results & Stats"
    }
    
    // MARK: CollectionView Datasource
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = graphCollectionView.dequeueReusableCellWithReuseIdentifier("ChartCardCell", forIndexPath: indexPath) as! ChartCardCollectionViewCell
        cell.simulationResults = simulationResults
        
        if indexPath.row == 0
        {
            cell.chartType = ChartTypes.EfficiencyPieChart
        } else if indexPath.row == 1
        {
            cell.chartType = ChartTypes.PreviousSimsLineChart
        } else
        {
            cell.chartType = ChartTypes.OutputsBarChart
        }
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let width = self.view.frame.width - 30
        return CGSizeMake(width, width * 0.7)
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
