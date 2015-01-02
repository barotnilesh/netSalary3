//
//  ViewController.swift
//  netSalary3
//
//  Created by nilebaro on 31/12/2014.
//  Copyright (c) 2014 itvolunteersuk. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var grossSalaryTextField: UITextField! = nil
    
    @IBOutlet weak var personalAllowanceTextField: UITextField!
    
    @IBOutlet weak var taxableSalaryTextField: UITextField!
    
    @IBOutlet weak var annualTaxField: UITextField!
    
    @IBOutlet weak var niTextField: UITextField!
    
    @IBOutlet weak var totalDiductionField: UITextField!
    
    @IBOutlet weak var yourTakeHomeField: UITextField!
    
    @IBAction func submitButton(sender: UIButton) {
    
        
        var totalSalary = (grossSalaryTextField.text as NSString).doubleValue
        var t1 = NetSalary()
        if totalSalary == 0.0 || totalSalary <= 7748.0 {
            grossSalaryTextField.text = "No NI or TAX to pay"
            
        } else if totalSalary > 7748.0 && totalSalary < 9440.0 {
            
            var nI: Double = (t1.nICalculation(totalSalary))
            var ni: String = "\(t1.nICalculation(totalSalary))"
            niTextField.text = ni
            var takehome: String = "\(totalSalary - nI )"
            
            yourTakeHomeField.text = takehome
            grossSalaryTextField.text = "No TAX to pay"
        
        } else if totalSalary > 9440.0 && totalSalary < 41451.0 {
        var totalSalary = (grossSalaryTextField.text as NSString).doubleValue
        personalAllowanceTextField.text = "\(t1.noTaxable)"
        var grossSalaryText : String = "\(t1.taxOnSalary(totalSalary))"
        
        taxableSalaryTextField.text = grossSalaryText
        
        var taxableSalaryDouble = (taxableSalaryTextField.text as NSString).doubleValue
        var aT: Double = (t1.taxCalculation(taxableSalaryDouble))
        var annualTax: String = "\(t1.taxCalculation(taxableSalaryDouble))"
        
        annualTaxField.text = annualTax
        var nI: Double = (t1.nICalculation(totalSalary))
        var ni: String = "\(t1.nICalculation(totalSalary))"
        
        niTextField.text = ni
        
        var tD: Double = aT + nI
        var totalDiductions : String = "\(tD)"
        totalDiductionField.text = totalDiductions
        
        var takehome: String = "\(totalSalary - tD)"
        
        yourTakeHomeField.text = takehome
            
        }
        else if totalSalary > 41451.0 {
            grossSalaryTextField.text = "Salary out of range!!"
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
        
        grossSalaryTextField.text = ""
        personalAllowanceTextField.text = ""
        taxableSalaryTextField.text = ""
        annualTaxField.text = ""
        niTextField.text = ""
        totalDiductionField.text = ""
        yourTakeHomeField.text = ""
    }
}

