//
//  ViewController.swift
//  UISliderTutorial
//
//  Created by Jorge Jimenez on 7/3/16.
//  Copyright © 2016 xadrijo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var sliderValueLabel: UILabel!
    var slider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        slider = UISlider(frame: CGRectMake(100, 100, 200, 23))
        slider.center = view.center
        
        slider.minimumValue = 0
        slider.maximumValue = 100
        
        slider.value = slider.maximumValue / 3
        
        view.addSubview(slider)
        
        slider.addTarget(self, action: #selector(ViewController.sliderValueChanged(_:)), forControlEvents: UIControlEvents.ValueChanged)
        slider.continuous = false
        
        changeThumbImage()
        changeSliderMinMaxColor()
    }

    func sliderValueChanged(sender: UISlider) {
        sliderValueLabel.text = "\(sender.value)"
    }

    func changeThumbImage() {
        slider.setThumbImage(UIImage(named: "ThumbNormal"), forState: .Normal)
        slider.setThumbImage(UIImage(named: "ThumbHighlighted"), forState: .Highlighted)
    }
    
    func changeSliderMinMaxColor() {
        slider.minimumTrackTintColor = UIColor.greenColor()
        slider.maximumTrackTintColor = UIColor.blackColor()
    }

}

