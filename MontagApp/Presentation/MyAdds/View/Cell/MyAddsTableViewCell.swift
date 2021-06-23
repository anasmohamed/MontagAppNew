//
//  AdvertisementsTableViewCell.swift
//  MontagApp
//
//  Created by no one on 02/06/2021.
//

import UIKit
import SDWebImage
class MyAddsTableViewCell : UITableViewCell {

    @IBOutlet weak var addAdvertisementToFavoriteBtn: UIButton!
    @IBOutlet weak var editAddBtn: UIButton!
    @IBOutlet weak var deletAddBtn: UIStackView!
    @IBOutlet weak var fromTimeLbl: UILabel!
    @IBOutlet weak var cityNameLbl: UILabel!
    @IBOutlet weak var advertiserNameLbl: UILabel!
    @IBOutlet weak var advertisementTitleLbl: UILabel!
    @IBOutlet weak var advertisementImage: UIImageView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var ratingCountLbl: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    var item = Advertisement()
    {
        didSet{
            fromTimeLbl.text = item.fromTime
            print(item.fromTime)
            cityNameLbl.text = item.cityName
            advertiserNameLbl.text = item.advertiserName
            advertisementTitleLbl.text = item.advertisementTile
            print(item.advertisementImage)
            let imageLink = item.advertisementImage?.replacingOccurrences(of: "http", with: "https")
            
            advertisementImage.sd_setImage(with: URL(string: imageLink!))
            ratingCountLbl.text = item.ratingCount
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        mainView.layer.cornerRadius = 10
        mainView.layer.borderWidth = 1
        mainView.layer.borderColor = UIColor.gray.cgColor
        deletAddBtn.layer.cornerRadius = 7
        editAddBtn.layer.cornerRadius = 7
        // Initialization code
    }

    @IBAction func addAdvertisementToFavoriteBtnDidTapped(_ sender: Any) {
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
   
}
