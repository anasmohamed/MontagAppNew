//
//  CategoiesCollectionViewCell.swift
//  MontagApp
//
//  Created by no one on 02/06/2021.
//

import UIKit

class CategoiesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryNameLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        categoryImageView.layer.borderWidth = categoryImageView.frame.width / 2
        // Initialization code
    }

}
