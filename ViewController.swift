//
//  ViewController.swift
//  play-swift
//
//  Created by Jason Mitchell on 9/2/14.
//  Copyright (c) 2014 Jason Mitchell. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private let tips: [String: Double] = ["15%": 0.15, "20%": 0.2, "25%": 0.25]
    private let key = "percentage"
    private let defaults = NSUserDefaults.standardUserDefaults()
    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipSegment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = NSUserDefaults.standardUserDefaults()
        self.billField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    @IBAction func tipPercentageAction(sender: AnyObject) {
        self.updateValues(self.billField)
    }
    
    @IBAction func onTap(sender: AnyObject) {
        self.billField.endEditing(true)
        
        self.updateValues(self.billField)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let idx: Int = self.defaults.integerForKey(self.key)
        self.tipSegment.selectedSegmentIndex = idx
    }
    
    @IBAction func updateValues(sender: AnyObject) {
        let bill  = NSString(string: self.billField.text).doubleValue
        let label = self.tipSegment.titleForSegmentAtIndex(tipSegment.selectedSegmentIndex)!
        
        let tip         = bill * self.tips[label]!;
        let total       = bill + tip;
        
        self.tipLabel.text   = String(format: "$%.2f", tip)
        self.totalLabel.text = String(format: "$%.2f", total)
    }
}

