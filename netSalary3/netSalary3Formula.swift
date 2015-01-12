//
//  netSalary3Formula.swift
//  netSalary3
//
//  Created by Nilesh Barot on 31/12/2014.
//  Copyright (c) 2014 itvolunteersuk. All rights reserved.
//

import Foundation
import UIKit
var taxYear = ["2012-2013","2013-2014","2014-2015"]

class NetSalary {
    var totalSalary: Double
    var taxableSalaryLimit1: Double
    var taxableSalaryLimit2: Double
    var noDiduction: Double
    var noTaxable: Double
    var taxableSalary: Double
    var annualTax: Double
    var annualTax1: Double
    var annualTax2: Double
    var taxRate1: Double
    var taxRate2: Double
    var totalTax: Double
    var nILimit1: Double
    var nILimit2: Double
    var nIRate1: Double
    var nIRate2: Double
    var nI: Double
    var nI1: Double
    var nI2: Double
    
    init () {
        self.totalSalary = 0.0
        self.taxableSalaryLimit1 = 0.0
        self.taxableSalaryLimit2 = 0.0
        self.noDiduction = 0.0 // 7748.0
        self.noTaxable = 0.0 // 9440.0
        self.taxableSalary = 0.0
        self.annualTax = 0.0
        self.annualTax1 = 0.0
        self.annualTax2 = 0.0
        self.taxRate1 = 0.0
        self.taxRate2 = 0.0
        self.totalTax = 0.0
        self.nILimit1 = 0.0 // NI Starts from 7749.00
        self.nILimit2 = 0.0 // NI changes from 41444
        self.nI =  0.0
        self.nIRate1 = 0.0
        self.nIRate2 = 0.0
        self.nI1 = 0.0
        self.nI2 = 0.0
    }
    
    func taxOnSalary(totalSalary:Double) -> Double {
        if totalSalary < noTaxable {
            taxableSalary = 0.0
        }
        else if totalSalary > noTaxable {
            taxableSalary = totalSalary - noTaxable
        }
        return taxableSalary
    }
    func taxCalculation(taxableSalary:Double) -> Double {
        if taxableSalary <= taxableSalaryLimit1 {
            var annualTax = ((taxableSalary) * taxRate1 / 100)
            return annualTax
            
        } else if taxableSalary > taxableSalaryLimit1 && taxableSalary <= taxableSalaryLimit2
        {
            var annualTax1 = ((taxableSalaryLimit1) * taxRate1 / 100)
            var annualTax2 = ((taxableSalary - taxableSalaryLimit1) * taxRate2 / 100)
            var annualTax = annualTax1 + annualTax2
            return annualTax
        }
        return annualTax
    }
    
    func nICalculation(totalSalary:Double) -> Double {
        if totalSalary <= noDiduction {
            println("No NI or TAX")
        } else if totalSalary >= nILimit1 && totalSalary <= nILimit2 {
            nI = ((totalSalary - noDiduction) * nIRate1 / 100)
        } else if totalSalary > nILimit2 {
            var nI1 = ((nILimit2 - noDiduction ) * nIRate1 / 100)
            var nI2 = ((totalSalary - nILimit2) * nIRate2 / 100)
            nI = nI1 + nI2
        }
        return nI
    }
}
class Year20122013 : NetSalary {
    override init () {
        super.init()
        
        super.noDiduction = 7592.0
        super.noTaxable = 8105.0
        super.taxRate1 = 20.0
        super.taxRate2 = 40.0
        super.nILimit1 = 7593.0
        super.nILimit2 = 42484.0
        super.nIRate1 = 12.0
        super.nIRate2 = 2.0
        super.taxableSalaryLimit1 = 34370.0
        super.taxableSalaryLimit2 = 100000.0
    }
}

class Year20132014 : NetSalary {
    override init () {
        super.init()
        
        super.noDiduction = 7748.0
        super.noTaxable = 9440.0
        super.taxRate1 = 20.0
        super.taxRate2 = 40.0
        super.nILimit1 = 7449.0
        super.nILimit2 = 41444.0
        super.nIRate1 = 12.0
        super.nIRate2 = 2.0
        super.taxableSalaryLimit1 = 32010.0
        super.taxableSalaryLimit2 = 100000.0
    }
}
class Year20142015 : NetSalary {
    override init () {
        super.init()
        
        super.noDiduction = 7956.0
        super.noTaxable = 10000.0
        super.taxRate1 = 20.0
        super.taxRate2 = 40.0
        super.nILimit1 = 7957.0
        super.nILimit2 = 41860.0
        super.nIRate1 = 12.0
        super.nIRate2 = 2.0
        super.taxableSalaryLimit1 = 31865.0
        super.taxableSalaryLimit2 = 100000.0
    }
}

//
//class NetSalary {
//    var totalSalary:Double
//    let noDiduction:Double
//    let noTaxable:Double
//    var taxableSalary: Double
//    var totalTax: Float
//    init () {
//        self.totalSalary = 0.00
//        self.noDiduction = 7748.00
//        self.noTaxable = 9440.00
//        self.taxableSalary = 00.00
//        self.totalTax = 00.00
//    }
//    
//    func taxOnSalary(totalSalary:Double) -> Double {
//        return totalSalary - noTaxable
//    }
//    func taxCalculation(taxableSalary:Double) -> Double {
//        return ((taxableSalary) * 20 / 100)
//    }
//    func nICalculation(totalSalary:Double) -> Double {
//        return ((totalSalary - noDiduction) * 12 / 100)
//    }
//    
//}
//var t1 = NetSalary()
//t1.taxOnSalary(10000)
//t1.taxableSalary
//t1.taxCalculation(t1.taxableSalary)



//        var t1 = NetSalary()
//        if totalSalary == 0.0 || totalSalary <= 7748.0 {
//            grossSalaryTextField.text = "No NI or TAX to pay"
//
//        } else if totalSalary > 7748.0 && totalSalary <= 9440.0 {
//
//            var nI: Double = (t1.nICalculation(totalSalary))
//            var ni: String = "\(t1.nICalculation(totalSalary))"
//            niTextField.text = ni
//            var takehome: String = "\(totalSalary - nI )"
//
//            yourTakeHomeField.text = takehome
//            grossSalaryTextField.text = "No TAX to pay"
//
//        } else if totalSalary > 9440.0 && totalSalary <= 41450.0 {
//        var totalSalary = (grossSalaryTextField.text as NSString).doubleValue
//        personalAllowanceTextField.text = "\(t1.noTaxable)"
//        var grossSalaryText : String = "\(t1.taxOnSalary(totalSalary))"
//
//        taxableSalaryTextField.text = grossSalaryText
//
//        var taxableSalaryDouble = (taxableSalaryTextField.text as NSString).doubleValue
//        var aT: Double = (t1.taxCalculation(taxableSalaryDouble))
//        var annualTax: String = "\(t1.taxCalculation(taxableSalaryDouble))"
//
//        annualTaxField.text = annualTax
//        var nI: Double = (t1.nICalculation(totalSalary))
//        var ni: String = "\(t1.nICalculation(totalSalary))"
//
//        niTextField.text = ni
//
//        var tD: Double = aT + nI
//        var totalDiductions : String = "\(tD)"
//        totalDiductionField.text = totalDiductions
//
//        var takehome: String = "\(totalSalary - tD)"
//
//        yourTakeHomeField.text = takehome
//
//        }
//        else if totalSalary >= 41451.0 {
//            grossSalaryTextField.text = "Salary out of range!!"
//        }