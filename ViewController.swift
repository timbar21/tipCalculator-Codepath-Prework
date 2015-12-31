//
//  ViewController.swift
//  tipCalculator
//
//  Created by Tim Barnard on 12/3/15.
//  Copyright (c) 2015 Tim Barnard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var taxLabel: UILabel!
    @IBOutlet weak var totalPPLabel: UILabel!
    @IBOutlet weak var numPeopleField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Sets the title in the Navigation Bar
        self.title = "Tip Calculator"        // Do any additional setup after loading the view, typically from a nib.
        
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        taxLabel.text = "$0.00"
        totalPPLabel.text = "$0.00"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    @IBAction func onEditingChanged(sender: AnyObject) {
        var tipPercentages = [0.18, 0.2, 0.22]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        
        println("User editing bill")
        let billAmount = NSString(string: billField.text!).doubleValue
        let numPeople = NSString(string: numPeopleField.text!).doubleValue
        let totalAmount = billAmount * 0.0875
        let tip = billAmount * tipPercentage
        let total = totalAmount  + billAmount + tip
        let totalPP = total/numPeople
        
        println("bill = ", billAmount)
        println("tip = ", tip)
        println("total = ", total)
        println("tipPercentage = ", tipPercentage)
        
        taxLabel.text = "$\(totalAmount)"
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        totalPPLabel.text = "$\(totalPP)"
        
        taxLabel.text = String(format: "$%.2f", totalAmount)
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        totalPPLabel.text = String(format: "$%.2f", totalPP)
        
    }
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

}

