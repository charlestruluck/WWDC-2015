//
//  ViewController.swift
//  Charles Truluck
//
//  Created by Charles on 4/14/15.
//  Copyright (c) 2015 Charles Truluck. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var run = 1
    
    @IBOutlet weak var projectsButton: UIButton!
    @IBOutlet weak var aboutMeButton: UIButton!
    @IBOutlet weak var helloLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        aboutMeButton.layer.borderColor = UIColor.whiteColor().CGColor
        aboutMeButton.layer.borderWidth = 1
        aboutMeButton.layer.cornerRadius = 10
        
        projectsButton.layer.cornerRadius = 10
        projectsButton.layer.borderWidth = 1
        projectsButton.layer.borderColor = UIColor.whiteColor().CGColor
        
        projectsButton.alpha = 0
        helloLabel.alpha = 0
        aboutMeButton.alpha = 0
        
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
                                    
                                    self.helloLabel.frame.origin.y = 100
                                    
                                }), completion: { finish in
                                    
                                    UIView.animateWithDuration(1.0, delay: 0.0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                                        
                                        self.projectsButton.alpha = 1
                                        self.aboutMeButton.alpha = 1
                                    
                                        }, completion: nil)
                                })
                        })
                })
        })
    }
    
    @IBAction func ProjectsAction(sender: AnyObject) {
        UIView.animateWithDuration(1.0, delay: 0.1, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
            
            self.aboutMeButton.alpha = 0
            self.projectsButton.alpha = 0
            self.helloLabel.alpha = 0
            
            }, completion: { finish in
                
                self.performSegueWithIdentifier("projectsSegue", sender: self)
                
        })
        
    }
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

