//
//  Category.swift
//  MontagApp
//
//  Created by no one on 02/06/2021.
//

import Foundation
import SwiftyJSON


struct Category {
    var categoryName : String?
    var categoryImage : String?
    init?(withJSON data: JSON) {
        self.categoryName = data["area_en"].stringValue
        self.categoryName = data["area_ar"].stringValue
        
    }
}
