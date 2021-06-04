//
//  AdvertisementsListViewModel.swift
//  MontagApp
//
//  Created by no one on 02/06/2021.
//

import Foundation
class AdvertisementsListViewModel {
    var categoryListViewModel : CategoryListViewModel!
    private var categoryDataAccess = CategoryDataAccess()
    private var advertisementsAPIMagager = AdvertisementsAPIMagager()
    private var advertisements: [Advertisement] = [Advertisement]()
    {
        didSet{
            reloadTableView.value = advertisements
        }
    }
    
    init() {
        self.categoryListViewModel = CategoryListViewModel(categoryDataAccess: categoryDataAccess)
    }
    var numberOfItems: Int {
        return advertisements.count
    }
    
    
    var reloadTableView: Observable<[Advertisement]> = Observable([])
    
    
    func fetchData() {
        advertisementsAPIMagager.getAdvertisements { [weak self] (advertisements, error) in
            
            if error == nil{
                self?.advertisements = advertisements!
            }
            
            //              self?.isLoading = false
        }
    }
    func getData(index: Int) -> Advertisement {
        return advertisements[index]
    }
}
