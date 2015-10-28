//
//  ResultsViewController.swift
//  My Chem Lab
//
//  Created by Kyle Zawacki on 10/27/15.
//  Copyright © 2015 University Of Wisconsin Parkside. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController, UICollectionViewDataSource
{
    // MARK: Properties
    var simulationResults:[String: Float]?
    @IBOutlet weak var graphCollectionView: UICollectionView!
    
    // MARK: Initialization
    override func viewDidLoad() {
        print("\(simulationResults)")
        graphCollectionView.dataSource = self
        self.edgesForExtendedLayout = UIRectEdge.None
    }
    
    // MARK: CollectionView Datasource
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        print(indexPath.row)
        var cell:PieChartCard
        
        cell = graphCollectionView.dequeueReusableCellWithReuseIdentifier("pieChartCell", forIndexPath: indexPath) as! PieChartCard
        let float:Float = simulationResults!["Convout"]!
        cell.conversionRatio = Int(float)
        print("Conv \(simulationResults)")
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
}
