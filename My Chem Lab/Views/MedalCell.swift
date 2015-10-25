//
//  MedalCell.swift
//  My Chem Lab
//
//  Created by Kyle Zawacki on 10/18/15.
//  Copyright © 2015 University Of Wisconsin Parkside. All rights reserved.
//
// 

import UIKit

class MedalCell: UICollectionViewCell
{
    // MARK: Properties
    @IBOutlet weak var medalImage: UIImageView!
    @IBOutlet weak var medalTitle: UILabel!
    
    var greyness:UIView?
    
    // MARK: Initializers
    
    func setToMedal(medalNumber number:Int)
    {
        let medalData = MedalStruct(withMedalNumber: number)
        medalImage.image = medalData.medalImage
        medalTitle.text = medalData.medalTitle
        
        if number > 2
        {
            setGreyness()

        }
    }
    
    func setGreyness()
    {
        if let _ = greyness
        {
            // Do nothing
        } else
        {
            greyness = UIView(frame: CGRectMake(-20, 0, self.frame.width+20, self.frame.height))
            greyness!.alpha = 0.8
            greyness!.backgroundColor = UIColor.whiteColor()
            
            medalImage.addSubview(greyness!)
        }
    }
}
