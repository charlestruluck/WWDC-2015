//
//  ProjectsViewController.swift
//  
//
//  Created by Charles on 4/15/15.
//
//

import UIKit

class ProjectsViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var divView: UIView!
    @IBOutlet weak var projectsTitle: UILabel!
    
    override func viewDidLoad() {
    
        self.scrollView.contentSize = CGSize(width:1334, height: 375)
        
        self.projectsTitle.alpha = 0
        self.divView.alpha = 0
        
    UIView.animateWithDuration(1.0, delay: 0.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
    
    self.divView.frame.origin.y = -10
    self.projectsTitle.frame.origin.y = -10
    self.projectsTitle.alpha = 1
    self.divView.alpha = 1
    
        }, completion: nil)
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
