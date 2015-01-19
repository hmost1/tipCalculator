//
//  SettingsViewController.swift
//  tips
//
//  Created by Haley Most on 1/18/15.
//  Copyright (c) 2015 Haley Most. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTip: UISegmentedControl!
    @IBOutlet weak var defaultSplit: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //checks if default already set, if not sets it
        var defaults = NSUserDefaults.standardUserDefaults()
        if let tipSettingNotNill = defaults.integerForKey("defaultTip") as Int?{
            self.defaultTip.selectedSegmentIndex = defaults.integerForKey("defaultTip")
        }
        else{
            defaults.setInteger(self.defaultTip.selectedSegmentIndex, forKey:"defaultTip")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismiss(sender: AnyObject) {
        //Save all the defaults here (on exit - could also do on view disappear)
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(self.defaultTip.selectedSegmentIndex, forKey:"defaultTip")
        defaults.synchronize()
        
        //exit the view
        dismissViewControllerAnimated(true, completion:nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
