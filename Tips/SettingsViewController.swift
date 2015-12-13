//
//  SettingsViewController.swift
//  Tips
//
//  Created by Siraj Zaneer on 12/6/15.
//  Copyright © 2015 Siraj Zaneer. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var firstPercent: UITextField!
    @IBOutlet weak var secondPercent: UITextField!
    @IBOutlet weak var thirdPercent: UITextField!
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if NSUserDefaults.standardUserDefaults().objectForKey("firstPercent") != nil {
            let firstOne = NSUserDefaults.standardUserDefaults().doubleForKey("firstPercent")
            if (firstOne % 1 == 0) {
                let firstConverter = String(Int(firstOne)) + "%"
                [tipControl .setTitle(firstConverter, forSegmentAtIndex:0)]
            } else {
                let firstConverter = String(firstOne) + "%"
                [tipControl .setTitle(firstConverter, forSegmentAtIndex:0)]
            }
        }
        
        if NSUserDefaults.standardUserDefaults().objectForKey("secondPercent") != nil {
            let secondOne = NSUserDefaults.standardUserDefaults().doubleForKey("secondPercent")
            if (secondOne % 1 == 0) {
                let secondConverter = String(Int(secondOne)) + "%"
                [tipControl .setTitle(secondConverter, forSegmentAtIndex:1)]
            } else {
                let secondConverter = String(secondOne) + "%"
                [tipControl .setTitle(secondConverter, forSegmentAtIndex:1)]
            }
        }
        
        if NSUserDefaults.standardUserDefaults().objectForKey("thirdPercent") != nil {
            let thirdOne = NSUserDefaults.standardUserDefaults().doubleForKey("thirdPercent")
            if (thirdOne % 1 == 0) {
                let thirdConverter = String(Int(thirdOne)) + "%"
                [tipControl .setTitle(thirdConverter, forSegmentAtIndex:2)]
            } else {
                let thirdConverter = String(thirdOne) + "%"
                [tipControl .setTitle(thirdConverter, forSegmentAtIndex:2)]
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func firstChanger(sender: AnyObject) {
        if let firstOne = Double(firstPercent.text!) {
            if (firstOne % 1 == 0) {
                let firstConverter = String(Int(firstOne)) + "%"
                [tipControl .setTitle(firstConverter, forSegmentAtIndex:0)]
                NSUserDefaults.standardUserDefaults().setDouble(Double(firstOne), forKey: "firstPercent")
                NSUserDefaults.standardUserDefaults().synchronize()
            } else {
                let firstConverter = String(firstOne) + "%"
                [tipControl .setTitle(firstConverter, forSegmentAtIndex:0)]
                NSUserDefaults.standardUserDefaults().setDouble(Double(firstOne), forKey: "firstPercent")
                NSUserDefaults.standardUserDefaults().synchronize()
            }
        }
    }
    
    @IBAction func secondChanger(sender: AnyObject) {
        if let secondOne = Double(secondPercent.text!) {
            if (secondOne % 1 == 0) {
                let secondConverter = String(Int(secondOne)) + "%"
                [tipControl .setTitle(secondConverter, forSegmentAtIndex:1)]
                NSUserDefaults.standardUserDefaults().setDouble(Double(secondOne), forKey: "secondPercent")
                NSUserDefaults.standardUserDefaults().synchronize()
            } else {
                let secondConverter = String(secondOne) + "%"
                [tipControl .setTitle(secondConverter, forSegmentAtIndex:1)]
                NSUserDefaults.standardUserDefaults().setDouble(Double(secondOne), forKey: "secondPercent")
                NSUserDefaults.standardUserDefaults().synchronize()
            }
        }
    }
    
    @IBAction func thirdChanger(sender: AnyObject) {
        if let thirdOne = Double(thirdPercent.text!) {
            if (thirdOne % 1 == 0) {
                let thirdConverter = String(Int(thirdOne)) + "%"
                [tipControl .setTitle(thirdConverter, forSegmentAtIndex:2)]
                NSUserDefaults.standardUserDefaults().setDouble(Double(thirdOne), forKey: "thirdPercent")
                NSUserDefaults.standardUserDefaults().synchronize()
            } else {
                let thirdConverter = String(thirdOne) + "%"
                [tipControl .setTitle(thirdConverter, forSegmentAtIndex:2)]
                NSUserDefaults.standardUserDefaults().setDouble(Double(thirdOne), forKey: "thirdPercent")
                NSUserDefaults.standardUserDefaults().synchronize()
            }
        }
    }
    
    @IBAction func onPercentChange(sender: AnyObject) {
        NSUserDefaults.standardUserDefaults().setInteger(9, forKey: "Hello")
        NSUserDefaults.standardUserDefaults().integerForKey("Hello")
        //var tipPercentages = [0.18, 0.2, 0.22]
        if let firstOne = Double(firstPercent.text!) {
            let firstConverter = String(firstOne)
            [tipControl .setTitle(firstConverter, forSegmentAtIndex:0)]
        }
        else {
            [tipControl .setTitle("18%", forSegmentAtIndex:0)]
        }
        if let secondOne = Double(secondPercent.text!) {
            let secondConverter = String(secondOne)
            [tipControl .setTitle(secondConverter, forSegmentAtIndex:1)]
        }
        else {
            [tipControl .setTitle("20%", forSegmentAtIndex:1)]
        }
        if let thirdOne = Double(thirdPercent.text!) {
            let thirdConverter = String(thirdOne)
            [tipControl .setTitle(thirdConverter, forSegmentAtIndex:2)]
        }
        else {
            [tipControl .setTitle("22%", forSegmentAtIndex:2)]
        }
    }
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
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
