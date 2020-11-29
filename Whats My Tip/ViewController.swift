//
//  ViewController.swift
//  Whats My Tip
//
//  Created by Tahmid Zaman on 11/26/20.
//

import UIKit

class ViewController: UIViewController {

    //Outlets = elements on screen which you want to configure
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Sets the title in the Navigation Bar
            //self.title = "Tip Calculator!"
    }

    
    @IBAction func onTap(_ sender: Any) {
        print("hello")
        view.endEditing(true) //dismiss keyboard, no matter what happens by force (true) it will always be dismissed
    }
    

    @IBAction func calculateTip(_ sender: Any) {
        //Get the bill amount
        let bill = Double(billField.text!) ??  0// let = constant variable

        //Calculate tip and total
        let tipPercent = [0.15, 0.18, 0.2]
        let tip = bill * tipPercent[tipControl.selectedSegmentIndex]

        let total = bill + tip
        
        //Update tip and total labels
        tipLabel.text = String(format: "$%.2f",tip)
        totalLabel.text = String(format: "$%.2f", total)
        //"$%.2f" -> "%.2f" will be relplaced by decimal with 2 place values; f expects decimal
        
        
        //tipLabel.text = "$\(tip)"
        //totalLabel.text = "$\(total)"
        // "$\(--)" expects you to place a variable within
        
        
        
    }
}

