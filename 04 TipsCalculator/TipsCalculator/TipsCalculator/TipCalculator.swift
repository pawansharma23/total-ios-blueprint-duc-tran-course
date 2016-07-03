//
//  TipCalculator.swift
//  TipsCalculator
//
//  Created by Jorge Jimenez on 6/30/16.
//  Copyright © 2016 xadrijo. All rights reserved.
//

import Foundation

class TipCalculator {
    
    var tipAmount: Float = 0
    var amountBeforeTax: Float = 0
    var tipPercentage: Float = 0
    var totalAmount: Float = 0
    var numberOfPerson: Int = 1
    var amountPerPerson: Float = 0
    
    init(amountBeforeTax: Float, tipPercentage: Float) {
        self.amountBeforeTax = amountBeforeTax
        self.tipPercentage = tipPercentage
    }
    
    func calculateTip() {
        tipAmount = amountBeforeTax * tipPercentage
        totalAmount = amountBeforeTax + tipAmount
        amountPerPerson = tipAmount / Float(numberOfPerson)
    }
}
