//
//  SettingsViewController.swift
//  Whats My Tip
//
//  Created by Tahmid Zaman on 11/28/20.
//

import UIKit

class SettingsViewController: UIViewController {

    let defaults = UserDefaults.standard
    
    @IBOutlet weak var myDarkSwitch: UISwitch!
   // let defaults = UserDefaults.standard
    
    @IBAction func switchChanged(_ sender: Any) {
        
        if myDarkSwitch.isOn == true // when switch is clicked
        {
            defaults.set(true, forKey: "isDarkMode")
            overrideUserInterfaceStyle = .dark
        }
        else
        {
            defaults.set(false, forKey: "isDarkMode")
            overrideUserInterfaceStyle = .light
        }
        defaults.synchronize() // Force UserDefaults to save.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //UIView Corner Radius
        self.view.layer.cornerRadius = 50.0;
        self.view.layer.masksToBounds = true

        //UIView Set up border
        self.view.layer.borderColor = UIColor.systemGreen.cgColor;
        self.view.layer.borderWidth = 3.0;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(defaults.bool(forKey: "isDarkMode") == true)
        {
            myDarkSwitch.isOn = true
            overrideUserInterfaceStyle = .dark
        }
        else
        {
            myDarkSwitch.isOn = false
            overrideUserInterfaceStyle = .light
        }
        
        // Do any additional setup after loading the view.
    }
    
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        //guard let viewController = segue.destination as? ViewController else {return} // prep for segue
        //viewController.isDarkMode = myDarkSwitch.isOn // pass dark switch value to viewController bool var isDarkMode
       
    }
    

}
