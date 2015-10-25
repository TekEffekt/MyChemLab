//
//  MedalStruct.swift
//  My Chem Lab
//
//  Created by Kyle Zawacki on 10/19/15.
//  Copyright © 2015 University Of Wisconsin Parkside. All rights reserved.
//
//  This models a medal object 

import UIKit

struct MedalStruct
{
    let medalImage: UIImage
    let medalTitle: String
    
    let medalTitles:[String] = ["Beginner Chemist", "Biodiesel 1", "World Saver", "The Lab Coat", "Water Drinker", "Oil Guzzler"]
    
    init(withMedalNumber number:Int)
    {
        medalImage = UIImage(named: "medal\(number)")!
        medalTitle = medalTitles[number-1]
    }
    
}