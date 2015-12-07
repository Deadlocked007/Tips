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
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onPercentChange(sender: AnyObject) {
        var tipPercentages = [0.18, 0.2, 0.22]
        let firstOne = NSString(string: firstPercent.text!).doubleValue
        if (firstOne > 0) {      // answerLabel ie UILabel
            tipPercentages[0] = firstOne
        }
        else {
        }
        [tipControl .setTitle(secondPercent.text, forSegmentAtIndex:0)]
        
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
