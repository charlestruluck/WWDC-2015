//
//  PushNoAnimationSegue.swift
//  Charles Truluck
//
//  Created by Charles on 4/14/15.
//  Copyright (c) 2015 Charles Truluck. All rights reserved.
//

import UIKit

class PushNoAnimationSegue: UIStoryboardSegue {
    override func perform() {
    
    sourceViewController.navigationController?!.pushViewController(destinationViewController as! UIViewController, animated: false)
    
    }
}