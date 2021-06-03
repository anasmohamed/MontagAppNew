//
//  AdvertisementsViewController + TableView.swift
//  MontagApp
//
//  Created by no one on 02/06/2021.
//

import Foundation
import UIKit
extension AdvertisementsViewController : UITableViewDelegate,UITableViewDataSource{
    
    func setupTableView() {
     advertisementsTableView.register(UINib(nibName: "AdvertisementsTableViewCell", bundle: nil), forCellReuseIdentifier: "AdvertisementsTableViewCell")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(advertisementsListViewModel.numberOfItems)
        return advertisementsListViewModel.numberOfItems
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AdvertisementsTableViewCell", for: indexPath) as! AdvertisementsTableViewCell
        cell.item = advertisementsListViewModel.getData(index: indexPath.row)
        return cell
    }
    
    
}
