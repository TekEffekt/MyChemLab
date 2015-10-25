//
//  MedalsViewController.swift
//  My Chem Lab
//
//  Created by Kyle Zawacki on 10/18/15.
//  Copyright © 2015 University Of Wisconsin Parkside. All rights reserved.
//

import UIKit

class MedalsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate
{
    // MARK: Properties
    @IBOutlet weak var medalCollectionView: UICollectionView!
    
    // MARK: Initialization
    override func viewDidLoad() {
        medalCollectionView.delegate = self
        medalCollectionView.dataSource = self
        
    }
    
    override func viewWillAppear(animated: Bool) {
        setupNavBar()
    }
    
    func setupNavBar()
    {
        self.tabBarController!.navigationItem.title = "Medals"
        self.tabBarController!.navigationItem.rightBarButtonItem = nil
    }
    
    // MARK: Collection View methods
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        let cell = medalCollectionView.dequeueReusableCellWithReuseIdentifier("medalCell", forIndexPath: indexPath) as! MedalCell
        cell.setToMedal(medalNumber: indexPath.row + 1)
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 6
    }
    
    func numberOfSectionsInCollectionView(collectionView:UICollectionView) -> Int {
        return 1
    }
    
    
}
