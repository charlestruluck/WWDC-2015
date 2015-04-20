//
//  AboutMeViewController.swift
//  Charles Truluck
//
//  Created by Charles on 4/14/15.
//  Copyright (c) 2015 Charles Truluck. All rights reserved.
//

import UIKit

class AboutMeViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView! // This was the hardest thing to make in my app. I don't know why but it was just confusing! :P
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var divView: UIView!
    @IBOutlet weak var aboutMeTitle: UILabel!
    
    override func viewDidLoad() {
        
        let aboutMeScroller = NSBundle.mainBundle().loadNibNamed("AboutMeScroller", owner: nil, options: nil)[0] as! UIView
        
        scrollView.addSubview(aboutMeScroller)
        
        scrollView.contentSize = aboutMeScroller.frame.size
        
        self.aboutMeTitle.alpha = 0
        self.divView.alpha = 0
        self.backButton.alpha = 0
        self.scrollView.alpha = 0
        
        UIView.animateWithDuration(1.5, delay: 0.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
            
            self.divView.frame.origin.y = -10
            self.aboutMeTitle.frame.origin.y = -10
            self.backButton.frame.origin.y = -10
            self.aboutMeTitle.alpha = 1
            self.divView.alpha = 1
            self.backButton.alpha = 1
            self.scrollView.alpha = 1
            
        }, completion: nil)
    }
    
    @IBAction func backAction(sender: AnyObject) {
        
        UIView.animateWithDuration(1.0, delay: 0.1, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
            
            self.backButton.alpha = 0
            self.aboutMeTitle.alpha = 0
            self.divView.alpha = 0
            self.divView.frame.origin.y = 100
            self.aboutMeTitle.frame.origin.y = 100
            self.backButton.frame.origin.y = 100
            
            }, completion: { finish in
                
                self.performSegueWithIdentifier("aboutBackSegue", sender: self)
                
        })
        
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
}