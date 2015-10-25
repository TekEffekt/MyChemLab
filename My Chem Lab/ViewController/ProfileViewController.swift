//
//  ProfileViewController.swift
//  My Chem Lab
//
//  Created by Kyle Zawacki on 10/19/15.
//  Copyright © 2015 University Of Wisconsin Parkside. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController
{
    override func viewDidLoad() {
    }
    
    override func viewWillAppear(animated: Bool) {
        setupNavbar()
    }
    
    func setupNavbar()
    {
        self.tabBarController!.navigationItem.title = "Your Profile"
        self.tabBarController!.navigationItem.rightBarButtonItem = nil
    }
}
