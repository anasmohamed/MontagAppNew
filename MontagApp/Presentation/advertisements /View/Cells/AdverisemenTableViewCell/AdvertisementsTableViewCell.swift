//
//  AdvertisementsTableViewCell.swift
//  MontagApp
//
//  Created by no one on 02/06/2021.
//

import UIKit
import SDWebImage
class AdvertisementsTableViewCell: UITableViewCell {

    @IBOutlet weak var addAdvertisementToFavoriteBtn: UIButton!
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
            cityNameLbl.text = item.cityName
            advertiserNameLbl.text = item.advertiserName
            advertisementTitleLbl.text = item.advertisementTile
            advertisementImage.sd_setImage(with: URL(string: item.advertisementImage ?? ""))
            ratingCountLbl.text = item.ratingCount
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func addAdvertisementToFavoriteBtnDidTapped(_ sender: Any) {
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
   
}
