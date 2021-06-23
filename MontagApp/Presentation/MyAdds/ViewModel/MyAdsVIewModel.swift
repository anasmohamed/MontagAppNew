//
//  MyAdsVIewModel.swift
//  MontagApp
//
//  Created by no one on 23/06/2021.
//

import Foundation
class MyAdsViewModel {
    private var myAdsAPIManager = MyAdsAPIManager()
    private var advertisements: [Advertisement] = [Advertisement]()
    {
        didSet{
            
            reloadTableView.value = advertisements
        }
    }
    var numberOfItems: Int {
        return advertisements.count
    }
    
    var userId = ""
    var apiToken = ""
    var reloadTableView: Observable<[Advertisement]> = Observable([])
    //       var order: Observable<orderId?> = Observable(nil)
    
    func updateOrderId(userId:String,apiToken:String)  {
        self.userId = userId
        self.apiToken = apiToken
    }
    func fetchData() {
        myAdsAPIManager.getMyAds(userId: userId, apiToken: apiToken) { [weak self] (advertisement,message ,error) in
            
            if advertisement != nil{
                self?.advertisements = advertisement!
            }
            
            //              self?.isLoading = false
        }
    }
   
    
    func getData(index: Int) -> Advertisement {
        return advertisements[index]
    }
}

