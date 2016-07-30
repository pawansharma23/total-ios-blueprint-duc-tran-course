//
//  ProductDetailViewController.swift
//  Pretty Apple V2
//
//  Created by Jorge Jimenez on 7/29/16.
//  Copyright © 2016 xadrijo. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController {
    
    // Model
    var product: Product?

    @IBOutlet weak var productImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productImageView.image = product?.image
    }

}
