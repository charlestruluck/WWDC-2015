//
//  ProjectsViewController.swift
//  
//
//  Created by Charles on 4/15/15.
//
//

import UIKit

var developer: String = "Charles"

class ProjectsViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var divView: UIView!
    @IBOutlet weak var projectsTitle: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var backgroundView: UIImageView!
    
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
            println("Wow, WWDC has been a dream for 2 years now! Finally- I'm 13 and I can apply for this once-in-a-lifetime oppertunity to open doors and windows in my future! I'll be on the road (no, Delta probably. Or American.) to San Francisco, and oh what a good time I will have. <3")
            println("But I'm so worried- what if I don't finish everything! I'm wasting valuble time puting this in here! Well hopefully they assume this is creativity? Typing what I'm thinking is a form of essay. WAIT- when I took the SATs I learned something- (Well a lot actually) that you give it your all and hope for the best. I still haven't gotten my score back on that things too, how long does it take? :0")
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
