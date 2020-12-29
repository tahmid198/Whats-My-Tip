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
    @IBOutlet weak var myView: UIView! //first view with Bill amount and tip %
    @IBOutlet weak var myView2: UIView! //second view with tip ammount and total
    
    override func viewWillAppear(_ animated: Bool) {
        
        myView.layer.cornerRadius = 15.0;
        myView.layer.borderWidth = 3.0;
        
        myView2.layer.cornerRadius = 15.0;
        myView2.layer.borderWidth = 3.0;
        myView2.layer.borderColor = UIColor.systemGreen.cgColor;

        
        self.navigationController?.isNavigationBarHidden =  true

        //UIView Corner Radius
        self.view.layer.cornerRadius = 20.0;
        self.view.layer.masksToBounds = true

        //UIView Set up border
        self.view.layer.borderColor = UIColor.systemGreen.cgColor;
        self.view.layer.borderWidth = 3.0;
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        billField.layer.cornerRadius = 15.0;
        billField.layer.borderWidth = 2.0;
        //BillAmountLabel.layer.borderColor = UIColor.red.cgColor;
        billField.clipsToBounds = true;
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

