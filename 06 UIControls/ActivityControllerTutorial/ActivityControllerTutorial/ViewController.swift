//
//  ViewController.swift
//  ActivityControllerTutorial
//
//  Created by Jorge Jimenez on 7/3/16.
//  Copyright © 2016 xadrijo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - IBOutlet
    @IBOutlet weak var textField: UITextField!
    
    // MARK: - Properties
    var activityViewController: UIActivityViewController!
    
    // MARK: - Target/Action

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func shareButtonTapped(sender: AnyObject) {
        if textField.text!.isEmpty {
            let message = "Please enter some text to share with the world"
            
            let alertController = UIAlertController(title: "Ooops", message: message, preferredStyle: .Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            presentViewController(alertController, animated: true, completion: nil)
        } else {
            activityViewController = UIActivityViewController(activityItems: [textField.text!], applicationActivities: nil)
            presentViewController(activityViewController, animated: true, completion: nil)
        }
        
    }
    
    // MARK: - UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == self.textField {
            textField.resignFirstResponder()
        }
        return true
    }
}

