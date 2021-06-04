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
    
    var item : CategoryViewModel?
    {
        didSet {
            guard let item = item  else {
                return
            }
            categoryNameLbl?.text = item.categoryName
            print(item.categoryImage!)
            categoryImageView!.image = UIImage(named: item.categoryImage!)
            
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        categoryImageView.layer.cornerRadius = categoryImageView.frame.size.width / 2
        categoryImageView.clipsToBounds = true
        categoryImageView.layoutIfNeeded()

        // Initialization code
    }
    
}
