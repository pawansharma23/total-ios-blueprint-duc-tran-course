//
//  ViewController.swift
//  DatePickerTuto02
//
//  Created by Jorge Jimenez on 7/3/16.
//  Copyright © 2016 xadrijo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var datePicker: UIDatePicker!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        datePicker = UIDatePicker()
        datePicker.center = view.center
        view.addSubview(datePicker)
        
        datePicker.addTarget(self, action: #selector(ViewController.datePickerChanged(_:)), forControlEvents: .ValueChanged)
    }
    
    func datePickerChanged(sender: UIDatePicker) {
        print("Selected date is \(sender.date)")
    }
    
    // MARK: - Target/Action

    @IBAction func changeDatePickerMinMaxDate(sender: AnyObject) {
        datePicker.datePickerMode = UIDatePickerMode.Date
        
        let oneYear: NSTimeInterval = 365 * 24 * 60 * 60
        let today = NSDate()
        
        let oneYearFromToday = today.dateByAddingTimeInterval(oneYear)
        let twoYearsFromToday = today.dateByAddingTimeInterval(oneYear * 2)
        
        // set the max and mix
        datePicker.minimumDate = oneYearFromToday
        datePicker.maximumDate = twoYearsFromToday
        
    }
  
    @IBAction func changeDatePicketToDefault(sender: AnyObject) {
        let today = NSDate()
        datePicker.datePickerMode = UIDatePickerMode.DateAndTime
        datePicker.setDate(today, animated: true)
        
    }

    @IBAction func changePickerToCountDownTimer(sender: AnyObject) {
        datePicker.datePickerMode = UIDatePickerMode.CountDownTimer
        let threeMinutes = (3 * 60) as NSTimeInterval
        datePicker.countDownDuration = threeMinutes
    }
}

