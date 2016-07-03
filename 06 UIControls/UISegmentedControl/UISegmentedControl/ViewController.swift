//
//  ViewController.swift
//  UISegmentedControl
//
//  Created by Jorge Jimenez on 7/3/16.
//  Copyright © 2016 xadrijo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var segmentedControl: UISegmentedControl!
    let items = ["Apple", "Google", "Facebook"]
    let itemsWithImage: [AnyObject] = ["Google", UIImage(named: "AppleIcon")!, "Facebook"]

    @IBOutlet weak var segmentTextLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        segmentedControl = UISegmentedControl(items: itemsWithImage)
        segmentedControl.center = CGPointMake(view.center.x, view.center.y + 200)
        
        view.addSubview(segmentedControl)
        
        segmentedControl.addTarget(self, action: #selector(ViewController.segmentedControlChanged(_:)), forControlEvents: .ValueChanged)
    }

    // MARK: - Target Action
    func segmentedControlChanged(sender: UISegmentedControl) {
        let selectedIndex = sender.selectedSegmentIndex
        print(selectedIndex)
        
        if let selectedSegment = sender.titleForSegmentAtIndex(selectedIndex) {
            segmentTextLabel.text = selectedSegment
        }
    }


}

