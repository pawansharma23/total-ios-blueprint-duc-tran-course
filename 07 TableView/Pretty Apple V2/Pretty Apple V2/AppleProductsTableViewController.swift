//
//  AppleProductsTableViewController.swift
//  Pretty Apple V2
//
//  Created by Jorge Jimenez on 7/28/16.
//  Copyright © 2016 xadrijo. All rights reserved.
//

import UIKit

class AppleProductsTableViewController: UITableViewController {
    
    // MARK: - VC Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = editButtonItem()
        
        // Make the row height dynamic
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    // MARK: - Data source
    
    lazy var productLines: [ProductLine] = {
        return ProductLine.productLines()
    }()

    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let productLine = productLines[section]
        return productLine.name
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return productLines.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let productLine = productLines[section]
        return productLine.products.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ProductCell", forIndexPath: indexPath) as! ProductTableViewCell
        
        let productLine = productLines[indexPath.section]
        let product = productLine.products[indexPath.row]
        
        cell.configureCellWith(product)

        return cell
    }
    

    // MARK: Edit Tableview
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            let productLine = productLines[indexPath.section]
            productLine.products.removeAtIndex(indexPath.row)
            // tell the table view to update with new data source
            //tableView.reloadData() // Bad way
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            switch identifier {
            case "ShowDetail":
                let productDetailVC = segue.destinationViewController as! ProductDetailViewController
                if let indexPath = self.tableView.indexPathForCell(sender as! UITableViewCell) {
                    productDetailVC.product = productAtIndexPath(indexPath)
                }
            case "ShowEdit":
                let editTableVC = segue.destinationViewController as!  EditTableViewController
                if let indexPath = self.tableView.indexPathForCell(sender as! UITableViewCell) {
                    editTableVC.product = productAtIndexPath(indexPath)
                }
            default:
                break
            }
        }
    }
    
    // MARK: - Helper Method
    
    func productAtIndexPath(indexPath: NSIndexPath) -> Product {
        let productLine = productLines[indexPath.section]
        return productLine.products[indexPath.row]
    }
}
