//
//  ProductTableViewCell.swift
//  Pretty Apple
//
//  Created by Jorge Jimenez on 7/14/16.
//  Copyright © 2016 xadrijo. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productTitleLabel: UILabel!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    
    func configureCellWith(product: Product)
    {
        productImageView.image = product.image
        productTitleLabel.text = product.title
        productDescriptionLabel.text = product.description
    }
    
}
