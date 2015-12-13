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

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
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
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onPriceChange(sender: AnyObject) {
        let percentage = tipControl.titleForSegmentAtIndex(0)
        let withoutSign = percentage?.stringByReplacingOccurrencesOfString("%", withString: "");
        let percent = Double(withoutSign!)
        if let userEntered = Double(billField.text!) {
            let output = Double(userEntered * (percent! / 100))
            totalLabel.text = String(output)
        }
    }
    
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

