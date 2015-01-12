//
//  ViewController.swift
//  netSalary3
//
//  Created by Nilesh Barot on 31/12/2014.
//  Copyright (c) 2014 itvolunteersuk. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var taxYearTextField: UITextField!
    
    @IBOutlet weak var grossSalaryTextField: UITextField! = nil
    
    @IBOutlet weak var personalAllowanceTextField: UITextField!
    
    @IBOutlet weak var taxableSalaryTextField: UITextField!
    
    @IBOutlet weak var annualTaxField: UITextField!
    
    @IBOutlet weak var niTextField: UITextField!
    
    @IBOutlet weak var totalDiductionField: UITextField!
    
    @IBOutlet weak var yourTakeHomeField: UITextField!
    
    @IBAction func submitButton(sender: UIButton) {
    
        var curYear = (taxYearTextField.text as NSString)
        var totalSalary = (grossSalaryTextField.text as NSString).doubleValue
        if totalSalary <= 0.0 {
            grossSalaryTextField.text = "Key in correct Salary"
        } else if totalSalary > 0.0 {
                if curYear == "2012-2013" {
 
                        var yr201213 = Year20122013()
                        personalAllowanceTextField.text = "8105.00"
                        var taxableSalary = (yr201213.taxOnSalary(totalSalary))
                        var x :Double = ("\(taxableSalary)" as NSString).doubleValue
                        taxableSalaryTextField.text = ("\(x)")
                        var Tax:Double = (yr201213.taxCalculation(x))
                        annualTaxField.text = "\(Tax)"
                        var nII = yr201213.nICalculation(totalSalary)
                        niTextField.text = "\(nII)"
                        var totalDiduction: Double = Tax + nII
                        totalDiductionField.text = "\(totalDiduction)"
                        var totalTakeHome: Double = totalSalary - totalDiduction
                        yourTakeHomeField.text = "\(totalTakeHome)"
                    
                } else if curYear == "2013-2014" {
                        var yr201314 = Year20132014()
                        personalAllowanceTextField.text = "9440.00"
                        var taxableSalary = (yr201314.taxOnSalary(totalSalary))
                        var x :Double = ("\(taxableSalary)" as NSString).doubleValue
                        taxableSalaryTextField.text = ("\(x)")
                        var Tax:Double = (yr201314.taxCalculation(x))
                        annualTaxField.text = "\(Tax)"
                        var nII = yr201314.nICalculation(totalSalary)
                        niTextField.text = "\(nII)"
                        var totalDiduction: Double = Tax + nII
                        totalDiductionField.text = "\(totalDiduction)"
                        var totalTakeHome: Double = totalSalary - totalDiduction
                        yourTakeHomeField.text = "\(totalTakeHome)"
            
                } else if curYear == "2014-2015" {

                        var yr201415 = Year20142015()
                        personalAllowanceTextField.text = "10000.00"
                        var taxableSalary = (yr201415.taxOnSalary(totalSalary))
                        var x :Double = ("\(taxableSalary)" as NSString).doubleValue
                        taxableSalaryTextField.text = ("\(x)")
                        var Tax:Double = (yr201415.taxCalculation(x))
                        annualTaxField.text = "\(Tax)"
                        var nII = yr201415.nICalculation(totalSalary)
                        niTextField.text = "\(nII)"
                        var totalDiduction: Double = Tax + nII
                        totalDiductionField.text = "\(totalDiduction)"
                        var totalTakeHome: Double = totalSalary - totalDiduction
                        yourTakeHomeField.text = "\(totalTakeHome)"
                    }
                } else {
                    taxYearTextField.text = "Enter correct tax year"
                }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
            self.view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func clearAllButton(sender: UIButton) {
        
        taxYearTextField.text = ""
        grossSalaryTextField.text = ""
        personalAllowanceTextField.text = ""
        taxableSalaryTextField.text = ""
        annualTaxField.text = ""
        niTextField.text = ""
        totalDiductionField.text = ""
        yourTakeHomeField.text = ""
    }
}

