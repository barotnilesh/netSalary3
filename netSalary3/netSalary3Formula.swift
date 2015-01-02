//
//  netSalary3Formula.swift
//  netSalary3
//
//  Created by nilebaro on 31/12/2014.
//  Copyright (c) 2014 itvolunteersuk. All rights reserved.
//

import Foundation
import UIKit

class NetSalary {
    var totalSalary:Double
    let noDiduction:Double
    let noTaxable:Double
    var taxableSalary: Double
    var totalTax: Float
    init () {
        self.totalSalary = 0.00
        self.noDiduction = 7748.00
        self.noTaxable = 9440.00
        self.taxableSalary = 00.00
        self.totalTax = 00.00
    }
    
    func taxOnSalary(totalSalary:Double) -> Double {
        return totalSalary - noTaxable
    }
    func taxCalculation(taxableSalary:Double) -> Double {
        return ((taxableSalary) * 20 / 100)
    }
    func nICalculation(totalSalary:Double) -> Double {
        return ((totalSalary - noDiduction) * 12 / 100)
    }
    
}
//var t1 = NetSalary()
//t1.taxOnSalary(10000)
//t1.taxableSalary
//t1.taxCalculation(t1.taxableSalary)