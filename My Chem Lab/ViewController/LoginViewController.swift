//
//  LoginViewController.swift
//  My Chem Lab
//
//  Created by Kyle Zawacki on 10/26/15.
//  Copyright © 2015 University Of Wisconsin Parkside. All rights reserved.
//

import UIKit
import AudioToolbox
import Charts

class LoginViewController: UIViewController, UITextFieldDelegate
{
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var usernameContainer: UIView!
    @IBOutlet weak var passwordContainer: UIView!
    var usernameField:JJMaterialTextfield?
    var passwordField:JJMaterialTextfield?
    var keyboardHeight:CGFloat = 0
    
    var indicatorBackground:UIView?
    var keyBoardShowing:Bool = false
    var orginalFrame:CGRect?
    
    var loggingIn:Bool = false
    
    override func viewDidLoad() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "textFieldPressed:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "textFieldHid:", name: UIKeyboardDidHideNotification, object: nil)
        
        TAOverlay.setOverlayIconColor(self.view.tintColor)
    }
    
    override func viewWillAppear(animated: Bool) {
        self.usernameField = JJMaterialTextfield(frame: CGRectMake(0,0, usernameContainer.frame.width, usernameContainer.frame.height))
        usernameField!.textColor = UIColor.whiteColor()
        usernameField!.enableMaterialPlaceHolder(true)
        usernameField!.tintColor = self.view.tintColor
        usernameField!.lineColor = self.view.tintColor
        usernameField!.placeholder = "Username"
        usernameField!.delegate = self
        usernameField!.autocorrectionType = .No
        usernameField!.autocapitalizationType = .None
        
        self.usernameContainer.addSubview(usernameField!)
        
        self.passwordField = JJMaterialTextfield(frame: CGRectMake(0,0, passwordContainer.frame.width, passwordContainer.frame.height))
        passwordField!.textColor = UIColor.whiteColor()
        passwordField!.enableMaterialPlaceHolder(true)
        passwordField!.tintColor = self.view.tintColor
        passwordField!.lineColor = self.view.tintColor
        passwordField!.placeholder = "password"
        passwordField!.delegate = self
        passwordField!.secureTextEntry = true
        
        self.passwordContainer.addSubview(passwordField!)
    }
    
    override func viewDidAppear(animated: Bool) {
        self.orginalFrame = self.view.frame
    }
    
    // MARK: Textfield Interaction
    func textFieldPressed(sender:NSNotification)
    {
        let userInfo = sender.userInfo
        
        if let userInfo = userInfo
        {
            self.keyboardHeight = userInfo[UIKeyboardFrameBeginUserInfoKey]!.CGRectValue.height
        }
        
        if !self.keyBoardShowing
        {
            self.animateTextField(withTextField: self.usernameField!, andUp: true)
        }
        
        self.keyBoardShowing = true
    }
    
    func textFieldHid(sender:NSNotification)
    {
        if self.loggingIn
        {
            NSTimer.scheduledTimerWithTimeInterval(0.0001, target: self, selector: "startIndicator", userInfo: nil, repeats: false)
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        self.keyBoardShowing = false
        self.animateTextField(withTextField: textField, andUp: false)
        
        return true
    }
    
    func animateTextField(withTextField textField:UITextField, andUp up:Bool)
    {
        let movementDistance:CGFloat = ((self.keyboardHeight/2) + 10) * -1
        let movementDuration = 0.3
        
        let movement:CGFloat = up ? movementDistance: -movementDistance
        
        UIView.beginAnimations("animateTextField", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(movementDuration)
        self.view.frame = CGRectOffset(self.view.frame, 0, movement)
        UIView.commitAnimations()
    }
    
    // MARK: Logging In
    @IBAction func loginButtonHit(sender: AnyObject)
    {
        self.usernameField!.resignFirstResponder()
        self.passwordField!.resignFirstResponder()
        
        self.loggingIn = true
        
        attemptLogin(withUsername: self.usernameField!.text!, andPassword: self.passwordField!.text!)
    }
    
    func attemptLogin(withUsername username:String, andPassword password:String)
    {
        if keyBoardShowing
        {
            self.animateTextField(withTextField: self.usernameField!, andUp: false)
        }
        
        if !self.keyBoardShowing
        {
            startIndicator()
        }
        
        self.keyBoardShowing = false
        
        let queue = NSOperationQueue()
        queue.addOperationWithBlock { () -> Void in
            let loginSuccesfull:Bool = LoginVerification.login(withUsername: username, andPassword: password)
            
            if(loginSuccesfull)
            {
                NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                    self.removeIndicator()
                    self.fadeOutScreen()
                })
            } else
            {
                NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                    self.removeIndicator()
                    self.shakeTextFields()
                    self.vibratePhone()
                    self.loggingIn = false
                })
            }
        }
    }
    
    func startIndicator()
    {
        TAOverlay.showOverlayWithLabel("Logging In", options: [TAOverlayOptions.OverlayTypeActivityLeaf,
            TAOverlayOptions.OpaqueBackground,TAOverlayOptions.OverlayShadow, TAOverlayOptions.OverlaySizeRoundedRect])
    }
    
    func removeIndicator()
    {
        TAOverlay.hideOverlay()
    }
    
    func shakeTextFields()
    {
        self.usernameField!.text = ""
        self.passwordField!.text = ""
        
        shake(view: self.usernameField!, inDirection: 4.0, andShakesDone: 0)
        shake(view: self.passwordField!, inDirection: 4.0, andShakesDone: 0)
    }
    
    func shake(view view:UIView, var inDirection direction:CGFloat, var andShakesDone shakes:Int)
    {
        UIView.animateWithDuration(0.04, animations: { () -> Void in
            view.transform = CGAffineTransformMakeTranslation(direction, 0)
            }) { (Bool) -> Void in
                if shakes >= 10
                {
                    view.transform = CGAffineTransformIdentity
                    return
                }
                shakes++
                direction = CGFloat(direction * -1)
                self.shake(view: view, inDirection: direction, andShakesDone: shakes)
        }
    }
    
    func vibratePhone()
    {
        AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
    }
    
    // MARK: Navigation
    
    func fadeOutScreen()
    {
        let frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height + self.navigationController!.navigationBar.frame.height)
        let blackness:UIView = UIView(frame: frame)
        blackness.backgroundColor = UIColor.blackColor()
        blackness.alpha = 0.0
        
        //self.view.addSubview(blackness)
        self.navigationController!.view.addSubview(blackness)
        
        UIView.animateWithDuration(1.5, animations: { () -> Void in
            blackness.alpha = 1.0
            }) { (Bool) -> Void in
                self.performSegueWithIdentifier("showMainView", sender: self)
        }
    }

}
