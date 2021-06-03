//
//  Advertisement.swift
//  MontagApp
//
//  Created by no one on 02/06/2021.
//

import Foundation
import SwiftyJSON
struct Advertisement {
    var advertisementTile : String?
    var fromTime : String?
    var cityName : String?
    var advertiserName : String?
    var advertisementImage : String?
    var ratingCount : String?
    init?(withJSON data: JSON) {
        self.advertisementTile = data["title"].stringValue
        print(data["title"].stringValue)
        self.fromTime = data["from_time"].stringValue
        self.cityName = data["city_name"].stringValue
        self.advertiserName = data["advertiser_name"].stringValue
        self.advertisementImage = data["image"].stringValue
        self.ratingCount = data["rating_count"].stringValue        
    }
    init() {
        
    }
}
