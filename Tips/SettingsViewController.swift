//
//  SettingsViewController.swift
//  Tips
//
//  Created by Siraj Zaneer on 12/6/15.
//  Copyright © 2015 Siraj Zaneer. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var greenTheme: UIButton!
    @IBOutlet weak var blueTheme: UIButton!
    @IBOutlet weak var redTheme: UIButton!
    @IBOutlet weak var darkTheme: UIButton!
    @IBOutlet weak var defaultTheme: UIButton!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var firstPercent: UITextField!
    @IBOutlet weak var secondPercent: UITextField!
    @IBOutlet weak var thirdPercent: UITextField!
    @IBOutlet weak var billSplit: UITextField!
    
    weak var delegate:TipViewControllerDelegate?
    
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
        
        if NSUserDefaults.standardUserDefaults().objectForKey("selected") != nil {
            tipControl.selectedSegmentIndex = NSUserDefaults.standardUserDefaults().integerForKey("selected")
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
        } else {
            let firstOne = 0
            let firstConverter = "0%"
            [tipControl .setTitle(firstConverter, forSegmentAtIndex:0)]
            NSUserDefaults.standardUserDefaults().setDouble(Double(firstOne), forKey: "firstPercent")
            NSUserDefaults.standardUserDefaults().synchronize()
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
        } else {
            let secondOne = 0
            let secondConverter = "0%"
            [tipControl .setTitle(secondConverter, forSegmentAtIndex:1)]
            NSUserDefaults.standardUserDefaults().setDouble(Double(secondOne), forKey: "secondPercent")
            NSUserDefaults.standardUserDefaults().synchronize()
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
        } else {
            let thirdOne = 0
            let thirdConverter = "0%"
            [tipControl .setTitle(thirdConverter, forSegmentAtIndex:2)]
            NSUserDefaults.standardUserDefaults().setDouble(Double(thirdOne), forKey: "thirdPercent")
            NSUserDefaults.standardUserDefaults().synchronize()
        }
    }
    
    @IBAction func segmentChange(sender: AnyObject) {
        let selection = tipControl.selectedSegmentIndex
        NSUserDefaults.standardUserDefaults().setInteger(selection, forKey: "selected")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    @IBAction func splitChange(sender: AnyObject) {
        if let number = Double(billSplit.text!) {
            if (number > 0) {
                NSUserDefaults.standardUserDefaults().setDouble(number, forKey: "customNumber")
            } else {
                NSUserDefaults.standardUserDefaults().removeObjectForKey("customNumber")
            }
        } else {
            NSUserDefaults.standardUserDefaults().removeObjectForKey("customNumber")
        }
        
    }
    
    @IBAction func lightThemeChange(sender: AnyObject) {
            NSUserDefaults.standardUserDefaults().setInteger(1, forKey: "theme")
    }
    
    @IBAction func darkThemeChange(sender: AnyObject) {
            NSUserDefaults.standardUserDefaults().setInteger(2, forKey: "theme")
    }
    
    
    @IBAction func redThemeChange(sender: AnyObject) {
        NSUserDefaults.standardUserDefaults().setInteger(3, forKey: "theme")
        
    }
    
    @IBAction func blueThemeChange(sender: AnyObject) {
        NSUserDefaults.standardUserDefaults().setInteger(4, forKey: "theme")
    }
    
    @IBAction func greenThemeChange(sender: AnyObject) {
        NSUserDefaults.standardUserDefaults().setInteger(5, forKey: "theme")
    }
    
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

    @IBAction func onReset(sender: AnyObject) {
        let appDomain = NSBundle.mainBundle().bundleIdentifier
        NSUserDefaults.standardUserDefaults().removePersistentDomainForName(appDomain!)
        self.view.setNeedsDisplay()
        delegate?.didReset()
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
