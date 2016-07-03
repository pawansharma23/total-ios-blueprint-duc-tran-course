//
//  ViewController.swift
//  CustomSwitches
//
//  Created by Jorge Jimenez on 7/3/16.
//  Copyright © 2016 xadrijo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var mySwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        mySwitch = UISwitch(frame: CGRect(x: 150, y: 200, width: 0, height: 0))
        view.addSubview(mySwitch)
        
        turnSwitchOn()
        
        changeMySwitchColors()
        
        mySwitch.addTarget(self, action: #selector(ViewController.mySwitchDidChange(_:)), forControlEvents: UIControlEvents.ValueChanged)
    }

    func turnSwitchOn() {
        mySwitch.setOn(true, animated: true)
        
        if mySwitch.on {
            print("the switch is on")
        } else {
            print("the switch is off")
        }
    }
    
    @IBAction func mySwitchDidChange(sender: UISwitch) {
        print("sender is = \(sender)")
        
        if mySwitch.on {
            print("the switch is on inside IB")
        } else {
            print("the switch is off inside IB")
        }
    }

    func changeMySwitchColors() {
        mySwitch.tintColor = UIColor.blackColor()
        mySwitch.onTintColor = UIColor.redColor()
        mySwitch.thumbTintColor = UIColor.greenColor()
    }

}

