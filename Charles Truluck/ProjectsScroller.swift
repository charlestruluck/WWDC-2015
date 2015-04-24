//
//  ProjectsScroller.swift
//  Charles Truluck
//
//  Created by Charles on 4/20/15.
//  Copyright (c) 2015 Charles Truluck. All rights reserved.
//

import UIKit

class ProjectsScroller: UIView {
    
    @IBOutlet weak var developerLabel: UILabel!
    @IBOutlet weak var startLabel: UILabel!
    @IBOutlet weak var slideContinueLabel: UILabel!
    
    override func awakeFromNib() {
        
        developerLabel.alpha = 0
        startLabel.alpha = 0
        slideContinueLabel.alpha = 0
        
        UIView.animateWithDuration(1.0, delay: 0.5, options: UIViewAnimationOptions.CurveEaseInOut, animations: { ()
            
            self.developerLabel.alpha = 1
            
            }, completion: { finish in
                
                UIView.animateWithDuration(1.0, delay: 1.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
                    
                    self.developerLabel.frame.origin.y = 100
                    self.startLabel.alpha = 1
                    
                    }, completion: { finish in
                        
                        UIView.animateWithDuration(1.0, delay: 0.5, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
                            
                            self.startLabel.frame.origin.y = 400
                            self.slideContinueLabel.alpha = 1
                            
                            }, completion: nil)
                        
                })
        })
    }
    @IBAction func testButton(sender: AnyObject) {
        println(":)")
    }
}
