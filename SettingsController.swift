//
//  SettingsController.swift
//  play-swift
//
//  Created by Jason Mitchell on 9/2/14.
//  Copyright (c) 2014 Jason Mitchell. All rights reserved.
//

import UIKit

class SettingsController: UIViewController {
    private let key = "percentage"
    private let defaults = NSUserDefaults.standardUserDefaults()
    
    @IBOutlet weak var percentageSegment: UISegmentedControl!
    
    @IBAction func closeClicked(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let idx: Int = self.defaults.integerForKey(self.key)
        self.percentageSegment.selectedSegmentIndex = idx
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        let idx = self.percentageSegment.selectedSegmentIndex
        self.defaults.setInteger(idx, forKey: self.key)
        self.defaults.synchronize()
    }

    @IBAction func dismiss(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}

