//
//  ViewController.swift
//  tips
//
//  Created by Haley Most on 1/17/15.
//  Copyright (c) 2015 Haley Most. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //outlets:
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    }

    override func didReceiveMemoryWarning() {
       
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        var tipPercentages = [0.18,0.2,0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
      
        var billAmount = billField.text._bridgeToObjectiveC().doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        tipLabel.text = String(format: "$%.2f",tip)
        totalLabel.text = String(format:  "%.2f",total)
    }
    
    @IBAction func valueChanged(sender: AnyObject) {
        onEditingChanged(sender)
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //get info from settings
        var defaults = NSUserDefaults.standardUserDefaults()
        
        if let tipSettingNotNill = defaults.integerForKey("defaultTip") as Int?{
            self.tipControl.selectedSegmentIndex = defaults.integerForKey("defaultTip")
        }
        else{
            defaults.setInteger(self.tipControl.selectedSegmentIndex, forKey:"defaultTip")
        }
        
        //redo the total calculation: 
        onEditingChanged(self)
    }
    
}

