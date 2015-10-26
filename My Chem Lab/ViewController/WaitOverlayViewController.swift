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
    // MARK: Properties
    @IBOutlet weak var vialImage: UIImageView!
    var backgroundBlur:UIVisualEffectView?
    
    // MARK: Initialization
    override func viewDidLoad()
    {
        
    }
    
    override func viewDidAppear(animated: Bool)
    {
        super.viewDidAppear(animated)
        setupBlurBackground()
        setupGlowingVial()
        fadeInOveraly()
    }
    
    func setupGlowingVial()
    {
        vialImage.image = vialImage.image!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
        
        let green = UIColor(red:0.00, green:0.75, blue:0.23, alpha:1.0)
        vialImage.tintColor = green
        vialImage.layer.shadowColor = green.CGColor
        vialImage.layer.shadowRadius = 5.0
        vialImage.layer.shadowOpacity = 0.9
        vialImage.layer.shadowOffset = CGSize.zero
        vialImage.layer.masksToBounds = false
    }
    
    func makeVialGlow()
    {
        let green = UIColor(red:0.00, green:0.75, blue:0.23, alpha:1.0)
        vialImage.startGlowingWithColor(green, intensity: 1.0)
    }
    
    func setupBlurBackground()
    {
        backgroundBlur = UIVisualEffectView(effect: UIBlurEffect(style: .Dark)) as UIVisualEffectView
        
        backgroundBlur!.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height*2)
        backgroundBlur!.center = self.view.center
        backgroundBlur!.alpha = 0.0
        self.view.insertSubview(backgroundBlur!, belowSubview: vialImage)
    }
    
    func fadeInOveraly()
    {
        UIView.animateWithDuration(0.6, animations: { () -> Void in
            self.backgroundBlur!.alpha = 1.0
            self.vialImage.alpha = 1.0
            }) { (Bool) -> Void in
                self.makeVialGlow()
        }
        
    }
}
