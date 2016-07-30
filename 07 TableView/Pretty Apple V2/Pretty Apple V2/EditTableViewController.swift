//
//  EditTableViewController.swift
//  Pretty Apple V2
//
//  Created by Jorge Jimenez on 7/29/16.
//  Copyright © 2016 xadrijo. All rights reserved.
//

import UIKit

class EditTableViewController: UITableViewController, UITextFieldDelegate, UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: - Model
    var product: Product?

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productTitleLabel: UITextField!
    @IBOutlet weak var productDescriptionTextView: UITextView!
    
    // MARK: - VC Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Edit Product"
        productImageView.image = product?.image
        productTitleLabel.text = product?.title
        productDescriptionTextView.text = product?.description
    }
    
    override func viewWillDisappear(animated: Bool) {
        product?.title = productTitleLabel.text!
        product?.description = productDescriptionTextView.text
        product?.image = productImageView.image!
    }
    
    // MARK: - UITextFieldDelegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // MARK: - UIScrollViewDelegate
    
    override func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        productDescriptionTextView.resignFirstResponder()
    }
    
    // MARK: - TableView interaction
    
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        if indexPath.section == 0 && indexPath.row == 0 {
            return indexPath
        } else {
            return nil
        }
    }
    
    // MARK: - Image Picker Controller
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 0 && indexPath.row == 0 {
            let picker = UIImagePickerController()
            picker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            picker.allowsEditing = false
            picker.delegate = self
            presentViewController(picker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        product?.image = image
        productImageView.image = image
        dismissViewControllerAnimated(true, completion: nil)
    }

}
















