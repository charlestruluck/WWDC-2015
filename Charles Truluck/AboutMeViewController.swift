//
//  AboutMeViewController.swift
//  Charles Truluck
//
//  Created by Charles on 4/14/15.
//  Copyright (c) 2015 Charles Truluck. All rights reserved.
//

import UIKit

class AboutMeViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var backgroundView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView! // This was the hardest thing to make in my app. I don't know why but it was just confusing! :P
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var divView: UIView!
    @IBOutlet weak var aboutMeTitle: UILabel!
    
    override func viewDidLoad() {
        
        backButton.layer.cornerRadius = 6
        backButton.layer.borderWidth = 1
        backButton.layer.borderColor = UIColor.orangeColor().CGColor
        
        let verticalMotionEffect = UIInterpolatingMotionEffect(keyPath: "center.y",
            type: .TiltAlongVerticalAxis)
        verticalMotionEffect.minimumRelativeValue = -50
        verticalMotionEffect.maximumRelativeValue = 50
        
        let horizontalMotionEffect = UIInterpolatingMotionEffect(keyPath: "center.x",
            type: .TiltAlongHorizontalAxis)
        horizontalMotionEffect.minimumRelativeValue = -50
        horizontalMotionEffect.maximumRelativeValue = 50
        
        let group = UIMotionEffectGroup()
        group.motionEffects = [horizontalMotionEffect, verticalMotionEffect]
        
        backgroundView.addMotionEffect(group)
        
        let aboutMeScroller = NSBundle.mainBundle().loadNibNamed("AboutMeScroller", owner: nil, options: nil)[0] as! UIView
        
        scrollView.addSubview(aboutMeScroller)
        
        aboutMeScroller.frame.size.height = scrollView.contentSize.height
        scrollView.contentSize.width = aboutMeScroller.frame.width
        
        self.aboutMeTitle.alpha = 0
        self.divView.alpha = 0
        self.backButton.alpha = 0
        self.scrollView.alpha = 0
        
        UIView.animateWithDuration(1.5, delay: 0.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
            
            self.aboutMeTitle.alpha = 1
            self.divView.alpha = 1
            self.backButton.alpha = 1
            self.scrollView.alpha = 1
            
        }, completion: nil)
    }
    
    @IBAction func backAction(sender: AnyObject) {
        
        UIView.animateWithDuration(1.0, delay: 0.1, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
            
            self.scrollView.alpha = 0
            self.backButton.alpha = 0
            self.aboutMeTitle.alpha = 0
            self.divView.alpha = 0
            
            }, completion: { finish in
                
                self.performSegueWithIdentifier("aboutBackSegue", sender: self)
                
        })
        
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
}