//
//  ViewController.swift
//  DatePickerTutorials
//
//  Created by Jorge Jimenez on 7/3/16.
//  Copyright © 2016 xadrijo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var pickerView: UIPickerView!
    var currentDataSource = ["Chile", "Argentina", "Crotia", "Greece", "Italy"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        pickerView = UIPickerView()
        pickerView.center = view.center
        view.addSubview(pickerView)
        
        pickerView.dataSource = self
        pickerView.delegate = self
    }
    
    // MARK: - UIPickerViewDataSource
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currentDataSource.count
    }
    
    // MARK: - UIPickerViewDelegate
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(currentDataSource[row])"
    }
    
    // MARK: - Target/Action
    @IBAction func pickValue(sender: AnyObject) {
        let selectedRow = pickerView.selectedRowInComponent(0)
        print(currentDataSource[selectedRow])
    }
    
    var newDataSource = ["France", "USA", "Germany", "Canada", "England", "Japan"]

    @IBAction func changeDataSource(sender: AnyObject) {
        currentDataSource = newDataSource
        pickerView.reloadComponent(0)
    }
}

