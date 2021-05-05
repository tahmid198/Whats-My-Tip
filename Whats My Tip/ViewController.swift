//
//  ViewController.swift
//  Whats My Tip
//
//  Created by Tahmid Zaman on 11/26/20.
//

import UIKit

class ViewController: UIViewController {

    //Outlets = elements on screen which you want to configure
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl! // tip segmented control
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var myView: UIView! //first view with Bill amount and tip %
    @IBOutlet weak var myView2: UIView! //second view with ti p ammount and total
    
    let defaults = UserDefaults.standard // Access UserDefaults
    //let darkModeDefaults = UserDefaults.standard
    var isDarkMode: Bool!
    
    
    @IBAction func didUnwindFromSettingsVC(_ sender: UIStoryboardSegue){ // unwind when save is clicked in settings and we go back to viewController. Make sure to connect save button to exit didUnwindFromSettingsVC
        guard let settingsVC = sender.source as? SettingsViewController else {return}
        isDarkMode = settingsVC.myDarkSwitch.isOn // save the value
        defaults.set(isDarkMode, forKey:"isDarkMode")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        myView.layer.borderWidth = 3.0;
        myView2.layer.cornerRadius = 15.0;
        myView2.layer.borderWidth = 3.0;
        myView2.layer.borderColor = UIColor.systemGreen.cgColor;

        self.view.layer.cornerRadius = 20.0; // UIView Corner Radius
        self.view.layer.masksToBounds = true
        self.view.layer.borderColor = UIColor.systemGreen.cgColor; // UIView Set up border
        self.view.layer.borderWidth = 3.0;
        
        
        self.navigationController?.isNavigationBarHidden =  false // will show nav bar when false

        self.billAmountTextField.becomeFirstResponder() // make keyboard always show for billAmountTextField
        self.title = "Tip Calculator!" // sets the title in the Navigation Bar
        
        if defaults.bool(forKey: "isDarkMode") == true
        {
            view.backgroundColor = UIColor.black
            titleLabel.textColor = UIColor.white
        }
        else
        {
           view.backgroundColor = UIColor.white
           titleLabel.textColor = UIColor.black
        }
    }

  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        billAmountTextField.layer.cornerRadius = 15.0;
        billAmountTextField.layer.borderWidth = 2.0;
        billAmountTextField.clipsToBounds = true;
        
        if defaults.bool(forKey: "isDarkMode") == true
        {
            view.backgroundColor = UIColor.black
            titleLabel.textColor = UIColor.white
        }
        else
        {
           view.backgroundColor = UIColor.white
           titleLabel.textColor = UIColor.black
        }
        
        let elapsedTime =  Int(NSDate().timeIntervalSince(defaults.object(forKey: "lastCalcTipDate") as! Date))  // when app first opens calculate elapsedTime since last time tip was calculated
       
        if(elapsedTime < 600) // if elapsedTime is less then 10 minutes
        {
            if(defaults.double(forKey: "myBill") != 0.0) // if it is not empty, if it is empty it will set it to 0.0 by default which looks bad
            {
                billAmountTextField.text  = String(defaults.double(forKey: "myBill")) // need to cast as string because cant assign int/double to a textfield
                tipControl.selectedSegmentIndex = defaults.integer(forKey: "myTipPercentage")
                tipAmountLabel.text = String(format: "$%.2f", defaults.double(forKey: "myTotalTip"))
                totalLabel.text = String(format: "$%.2f", defaults.double(forKey: "myTotalBill"))
            }
        }
    }

    
    @IBAction func onTap(_ sender: Any) {
//        print("hello")
        view.endEditing(true) //dismiss keyboard, no matter what happens by force (true) it will always be dismissed
    }
    
    
    @IBAction func calculateTip(_ sender: Any) {
        
        let bill = Double(billAmountTextField.text!) ??  0 // //Get the bill amount from the text field input
        let tipPercent = [0.15, 0.18, 0.2]
        let tip = bill * tipPercent[tipControl.selectedSegmentIndex] // Calculate total tip
        let total = bill + tip
        
        tipAmountLabel.text = String(format: "$%.2f",tip) // update tip and total labels
        totalLabel.text = String(format: "$%.2f", total)
        
        defaults.set(bill, forKey: "myBill") // set myBill for bill value
        defaults.set(tipControl.selectedSegmentIndex, forKey: "myTipPercentage") //set myTipPercentage to selected tip percent
        defaults.set(tip, forKey: "myTotalTip")
        defaults.set(total, forKey: "myTotalBill")
        
        defaults.set(NSDate(), forKey: "lastCalcTipDate") // save the time when tip was calculated
        
        defaults.synchronize() // Force UserDefaults to save.
     
    }
}


// Notes:
// "$%.2f" -> "%.2f" will be relplaced by decimal with 2 place values; f expects decimal
// tipLabel.text = "$\(tip)"
// totalLabel.text = "$\(total)"
// "$\(--)" expects you to place a variable within
