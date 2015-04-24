//
//  ProjectsViewController.swift
//  
//
//  Created by Charles on 4/15/15.
//
//

import UIKit

class ProjectsViewController: UIViewController, UIScrollViewDelegate {
    
    var developer: String = "Charles"
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var divView: UIView!
    @IBOutlet weak var projectsTitle: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var backgroundView: UIImageView!
    
    override func viewDidLoad() {
        
        self.scrollView.contentOffset = CGPointMake(self.scrollView.contentOffset.x, 0)
        
        scrollView.delegate = self
        
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
        
        let projectsScroller = NSBundle.mainBundle().loadNibNamed("ProjectsScroller", owner: nil, options: nil)[0] as! UIView
        
        scrollView.addSubview(projectsScroller)
        
        projectsScroller.frame.size.height = scrollView.contentSize.height
        scrollView.contentSize.width = projectsScroller.frame.width
        
        self.projectsTitle.alpha = 0
        self.divView.alpha = 0
        self.backButton.alpha = 0
        
    UIView.animateWithDuration(1.0, delay: 0.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
    
        self.backButton.alpha = 1
        self.projectsTitle.alpha = 1
        self.divView.alpha = 1
    
        }, completion: nil)
        if developer == "Charles"{
            // °_°
            //^_^
            //:P
            //ಠ_ಠ
            //\( ﾟ◡ﾟ)/
        }
    }
    
    @IBAction func backAction(sender: AnyObject) {
        
        UIView.animateWithDuration(1.0, delay: 0.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
            
            //animations always make things look better ;)
            self.projectsTitle.alpha = 0
            self.divView.alpha = 0
            self.scrollView.alpha = 0
            self.backButton.alpha = 0
            
            }, completion: { finish in
                
            //pull up main view.
            self.performSegueWithIdentifier("projectsBackSegue", sender: self)
                
            })
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
