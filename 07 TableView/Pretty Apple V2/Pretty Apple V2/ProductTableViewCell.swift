//
//  ProductTableViewCell.swift
//  Pretty Apple V2
//
//  Created by Jorge Jimenez on 7/29/16.
//  Copyright © 2016 xadrijo. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var productTitleLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productDescriptionLabel: UILabel!
   
    func configureCellWith(product: Product) {
        
        productImageView.image = product.image
        productDescriptionLabel.text = product.description
        productTitleLabel.text = product.title
    }

}
