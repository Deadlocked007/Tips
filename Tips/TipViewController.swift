//
//  TipViewController.swift
//  Tips
//
//  Created by Siraj Zaneer on 12/6/15.
//  Copyright © 2015 Siraj Zaneer. All rights reserved.
//

import UIKit

class TipViewController: UIViewController {
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipBackground: UIView!
    @IBOutlet weak var fourTotal: UILabel!
    @IBOutlet weak var customTotal: UILabel!
    @IBOutlet weak var threeTotal: UILabel!
    @IBOutlet weak var twoTotal: UILabel!
    @IBOutlet weak var customNumber: UILabel!
    
    @IBOutlet weak var darkTheme: UIView!
    @IBOutlet weak var redTheme: UIView!
    @IBOutlet weak var blueTheme: UIView!
    @IBOutlet weak var greenTheme: UIView!
    @IBOutlet weak var moneySign: UILabel!
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        if NSUserDefaults.standardUserDefaults().objectForKey("customNumber") != nil {
            let custom = NSUserDefaults.standardUserDefaults().doubleForKey("customNumber")
            customNumber.text = String(custom)
        } else {
            customNumber.text = "7"
        }
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
            let percentage = tipControl.titleForSegmentAtIndex(tipControl.selectedSegmentIndex)
            let withoutSign = percentage?.stringByReplacingOccurrencesOfString("%", withString: "");
            let percent = Double(withoutSign!)
            if let userEntered = Double(billField.text!) {
                let formatter = NSNumberFormatter()
                formatter.numberStyle = .CurrencyStyle
                formatter.locale = NSLocale.currentLocale()
                let output = Double(userEntered * (percent! / 100))
                tipLabel.text = formatter.stringFromNumber(output)
                totalLabel.text = formatter.stringFromNumber(output + userEntered)
                twoTotal.text = formatter.stringFromNumber((output + userEntered) / 2)
                threeTotal.text = formatter.stringFromNumber((output + userEntered) / 3)
                fourTotal.text = formatter.stringFromNumber((output + userEntered) / 4)
                if NSUserDefaults.standardUserDefaults().objectForKey("customNumber") != nil {
                    let custom = NSUserDefaults.standardUserDefaults().doubleForKey("customNumber")
                    customTotal.text = formatter.stringFromNumber((output + userEntered) / custom)
                } else {
                    customTotal.text = formatter.stringFromNumber((output + userEntered) / 7)
                }
                UIView.animateWithDuration(0.4, animations: {
                    self.tipBackground.alpha = 1
                    
                    self.tipControl.alpha = 1
                })
            } else {
                let formatter = NSNumberFormatter()
                formatter.numberStyle = .CurrencyStyle
                formatter.locale = NSLocale.currentLocale()
                UIView.animateWithDuration(0.4, animations: {
                    self.tipBackground.alpha = 0
                    self.tipControl.alpha = 0
                })
                tipLabel.text = formatter.stringFromNumber(0.00)
                totalLabel.text = formatter.stringFromNumber(0.00)
            }
        }
        if NSUserDefaults.standardUserDefaults().objectForKey("theme") != nil {
            let themeNumber = NSUserDefaults.standardUserDefaults().integerForKey("theme")
            if (themeNumber == 1) {
                darkTheme.alpha = 0
            } else if (themeNumber == 2) {
                darkTheme.backgroundColor = UIColor.blackColor()
                darkTheme.alpha = 0.45
            } else if (themeNumber == 3) {
                darkTheme.backgroundColor = UIColor.redColor()
                darkTheme.alpha = 0.45
            } else if (themeNumber == 4) {
                darkTheme.backgroundColor = UIColor.blueColor()
                darkTheme.alpha = 0.45
            } else if (themeNumber == 5) {
                darkTheme.backgroundColor = UIColor.greenColor()
                darkTheme.alpha = 0.45
            }
        } else {
            darkTheme.alpha = 0
        }
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        formatter.locale = NSLocale.currentLocale()
        moneySign.text = formatter.currencySymbol
        moneySign.textColor = UIColor.grayColor()
        //do ns thingy here
        //do value after closing here
        //nslocale + nsnumber formatter to do currency stuff
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        print("view did appear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        billField.becomeFirstResponder()
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        formatter.locale = NSLocale.currentLocale()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = formatter.stringFromNumber(0.00)
        totalLabel.text = formatter.stringFromNumber(0.00)
        if ((billField.text?.isEmpty) != nil) {
            moneySign.hidden = false
        } else {
            moneySign.hidden = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func whenPercentSelected(sender: AnyObject) {
        view.endEditing(true)
        let percentage = tipControl.titleForSegmentAtIndex(tipControl.selectedSegmentIndex)
        let withoutSign = percentage?.stringByReplacingOccurrencesOfString("%", withString: "");
        let percent = Double(withoutSign!)
        if let userEntered = Double(billField.text!) {
            let formatter = NSNumberFormatter()
            formatter.numberStyle = .CurrencyStyle
            formatter.locale = NSLocale.currentLocale()
            let output = Double(userEntered * (percent! / 100))
            tipLabel.text = formatter.stringFromNumber(output)
            totalLabel.text = formatter.stringFromNumber(output + userEntered)
            twoTotal.text = formatter.stringFromNumber((output + userEntered) / 2)
            threeTotal.text = formatter.stringFromNumber((output + userEntered) / 3)
            fourTotal.text = formatter.stringFromNumber((output + userEntered) / 4)
            if NSUserDefaults.standardUserDefaults().objectForKey("customNumber") != nil {
                let custom = NSUserDefaults.standardUserDefaults().doubleForKey("customNumber")
                customTotal.text = formatter.stringFromNumber((output + userEntered) / custom)
            } else {
                customTotal.text = formatter.stringFromNumber((output + userEntered) / 7)
            }
            UIView.animateWithDuration(0.4, animations: {
                self.tipBackground.alpha = 1
                self.tipControl.alpha = 1
            })
        } else {
            let formatter = NSNumberFormatter()
            formatter.numberStyle = .CurrencyStyle
            formatter.locale = NSLocale.currentLocale()
            UIView.animateWithDuration(0.4, animations: {
                self.tipBackground.alpha = 0
                self.tipControl.alpha = 0
            })
            tipLabel.text = formatter.stringFromNumber(0.00)
            totalLabel.text = formatter.stringFromNumber(0.00)
        }
    }
    
    @IBAction func onPriceChange(sender: AnyObject) {
        let percentage = tipControl.titleForSegmentAtIndex(tipControl.selectedSegmentIndex)
        let withoutSign = percentage?.stringByReplacingOccurrencesOfString("%", withString: "");
        let percent = Double(withoutSign!)
        if let userEntered = Double(billField.text!) {
            moneySign.hidden = true
            let formatter = NSNumberFormatter()
            formatter.numberStyle = .CurrencyStyle
            formatter.locale = NSLocale.currentLocale()
            let output = Double(userEntered * (percent! / 100))
            tipLabel.text = formatter.stringFromNumber(output)
            totalLabel.text = formatter.stringFromNumber(output + userEntered)
            twoTotal.text = formatter.stringFromNumber((output + userEntered) / 2)
            threeTotal.text = formatter.stringFromNumber((output + userEntered) / 3)
            fourTotal.text = formatter.stringFromNumber((output + userEntered) / 4)
            if NSUserDefaults.standardUserDefaults().objectForKey("customNumber") != nil {
                let custom = NSUserDefaults.standardUserDefaults().doubleForKey("customNumber")
                customTotal.text = formatter.stringFromNumber((output + userEntered) / custom)
            } else {
                customTotal.text = formatter.stringFromNumber((output + userEntered) / 7)
            }
            UIView.animateWithDuration(0.4, animations: {
                self.tipBackground.alpha = 1
                self.tipControl.alpha = 1
            })
        } else {
            let formatter = NSNumberFormatter()
            formatter.numberStyle = .CurrencyStyle
            formatter.locale = NSLocale.currentLocale()
            UIView.animateWithDuration(0.4, animations: {
                self.tipBackground.alpha = 0
                self.tipControl.alpha = 0
            })
            tipLabel.text = formatter.stringFromNumber(0.00)
            totalLabel.text = formatter.stringFromNumber(0.00)
            moneySign.hidden = false
        }
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

