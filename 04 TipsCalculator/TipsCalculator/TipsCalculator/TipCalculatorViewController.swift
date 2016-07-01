//
//  TipCalculatorViewController.swift
//  TipsCalculator
//
//  Created by Jorge Jimenez on 6/30/16.
//  Copyright © 2016 xadrijo. All rights reserved.
//

import UIKit

class TipCalculatorViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - IBOutlet
    @IBOutlet weak var amountBeforeTaxTextField: UITextField!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var tipPercentageSlider: UISlider!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var numberOfPeopleLabel: UILabel!
    @IBOutlet weak var numberOfPeopleSlider: UISlider!
    
    // MARK: - Properties
    var tipCalculator = TipCalculator(amountBeforeTax: 25.00, tipPercentage: 0.2)
    
    // MARK: - View Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        amountBeforeTaxTextField.text = String(format: "%0.2f", arguments: [tipCalculator.amountBeforeTax])
        tipPercentageLabel.text = String(format: "Tip %d%%:", arguments: [Int(tipCalculator.tipPercentage * 100)])
        
    }

    func calcTip() {
        tipCalculator.tipPercentage = Float(tipPercentageSlider.value)
        
        if amountBeforeTaxTextField.text != "" {
            tipCalculator.amountBeforeTax = Float(amountBeforeTaxTextField.text!)!
        } else {
            tipCalculator.amountBeforeTax = 0
        }
        
        
        tipCalculator.calculateTip()
        updateUI()
    }
    
    func updateUI() {
        resultLabel.text = String(format: "Total: $%0.2f Tip: $%0.2f", arguments: [tipCalculator.totalAmount, tipCalculator.tipAmount])
    }
    
    // MARK: - UIControl Events
    @IBAction func amountBeforeTaxTextFieldChanged(sender: AnyObject) {
        calcTip()
        print(tipCalculator.amountBeforeTax)
        print("Text Field value changed")
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == amountBeforeTaxTextField {
            textField.resignFirstResponder()
            calcTip()
        }
        return true
    }

    @IBAction func tipPercentageSliderValueChanged(sender: AnyObject) {
        tipPercentageLabel.text! = String(format: "Tip: %02d%%", arguments: [Int(tipPercentageSlider.value * 100)])
        calcTip()
    }
}
