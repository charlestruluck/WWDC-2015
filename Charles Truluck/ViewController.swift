//
//  ViewController.swift
//  Charles Truluck
//
//  Created by Charles on 4/14/15.
//  Copyright (c) 2015 Charles Truluck. All rights reserved.
//

import UIKit

var run: Bool = true

class ViewController: UIViewController {
    
    @IBOutlet weak var backgroundView: UIImageView!
    @IBOutlet weak var projectsButton: UIButton!
    @IBOutlet weak var aboutMeButton: UIButton!
    @IBOutlet weak var helloLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let simAlert = UIAlertView()
        
        simAlert.title = "Simulator Detected!"
        simAlert.message = "This app was designed to run on an iPhone 6. Some effects like parallax won't work!"
        simAlert.addButtonWithTitle("Alright!")
        
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
        
        aboutMeButton.layer.borderColor = UIColor.orangeColor().CGColor
        aboutMeButton.layer.borderWidth = 1
        aboutMeButton.layer.cornerRadius = 6
        
        projectsButton.layer.cornerRadius = 6
        projectsButton.layer.borderWidth = 1
        projectsButton.layer.borderColor = UIColor.orangeColor().CGColor
        
        projectsButton.alpha = 0
        helloLabel.alpha = 0
        aboutMeButton.alpha = 0
        
        if run == true {
            
            #if (arch(i386) || arch(x86_64)) && os(iOS)
                simAlert.show()
            #endif
            
        UIView.animateWithDuration(1.0, delay: 1.0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            
            self.helloLabel.alpha = 1
            
            }, completion: { finish in
                UIView.animateWithDuration(1.0, delay: 0.5, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
                    
                    self.helloLabel.alpha = 0
                    
                    }, completion: { finish in
                        
                        self.helloLabel.text = "I'm Charles!"
                        
                        UIView.animateWithDuration(1.0, delay: 0.5, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
                            
                            self.helloLabel.alpha = 1
                            
                            }, completion: { finish in
                                UIView.animateWithDuration(1.0, delay: 0.5, usingSpringWithDamping: 3.0, initialSpringVelocity: 3.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: ({
                                    
                                    self.helloLabel.frame.origin.y = 10
                                    
                                }), completion: { finish in
                                    
                                    UIView.animateWithDuration(1.0, delay: 0.0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                                        
                                        let run: Float = 0
                                        
                                        self.projectsButton.alpha = 1
                                        self.aboutMeButton.alpha = 1
                                    
                                        }, completion: nil)
                                })
                        })
                })
        })
            run = false
        } else {
            
            self.helloLabel.frame.origin.y = 10
            
            UIView.animateWithDuration(1.0, delay: 1.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
                
                self.projectsButton.alpha = 1
                self.helloLabel.alpha = 1
                self.aboutMeButton.alpha = 1
                
            }, completion: nil)
        }
    }
    
    //Opens projects view
    @IBAction func ProjectsAction(sender: AnyObject) {
        UIView.animateWithDuration(1.0, delay: 0.1, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
            
            self.aboutMeButton.alpha = 0
            self.projectsButton.alpha = 0
            self.helloLabel.alpha = 0
            
            }, completion: { finish in
                
                self.performSegueWithIdentifier("projectsSegue", sender: self)
                
        })
        
    }
    
    //Opens about me view 
    
    @IBAction func aboutMeAction(sender: AnyObject) {
        UIView.animateWithDuration(1.0, delay: 0.1, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
            
            self.aboutMeButton.alpha = 0
            self.projectsButton.alpha = 0
            self.helloLabel.alpha = 0
            
            }, completion: { finish in
                
                self.performSegueWithIdentifier("aboutMeSegue", sender: self)
                
            })
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

