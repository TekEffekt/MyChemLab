//
//  WaitOverlayViewController.swift
//  My Chem Lab
//
//  Created by Kyle Zawacki on 10/24/15.
//  Copyright © 2015 University Of Wisconsin Parkside. All rights reserved.
//

import UIKit

class WaitOverlayViewController: UIViewController
{
    @IBOutlet weak var vialImage: UIImageView!
    
    override func viewDidLoad()
    {
        
    }
    
    override func viewDidAppear(animated: Bool)
    {
        super.viewDidAppear(animated)
        
        let backgroundBlur = UIVisualEffectView(effect: UIBlurEffect(style: .Dark)) as UIVisualEffectView
        
        backgroundBlur.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height*2)
        backgroundBlur.center = self.view.center
        backgroundBlur.alpha = 0.0
        self.view.insertSubview(backgroundBlur, belowSubview: vialImage)
        
        vialImage.image = vialImage.image!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
        vialImage.tintColor = UIColor.greenColor()
        
//        [self makeViewGlow:tappedIcon color:self.view.tintColor];
        
        fadeInOveraly(backgroundBlur)
    }
    
    func fadeInOveraly(blur:UIVisualEffectView)
    {
        UIView.animateWithDuration(0.6) { () -> Void in
            blur.alpha = 1.0
            self.vialImage.alpha = 1.0
        }
    }
}
