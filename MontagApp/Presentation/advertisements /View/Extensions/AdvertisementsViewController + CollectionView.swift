//
//  AdvertisementsViewController + CollectionView.swift
//  MontagApp
//
//  Created by no one on 02/06/2021.
//

import Foundation
import UIKit
extension AdvertisementsViewController : UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func setupCollectionView()
       {
        categriesCollectionView.register(UINib(nibName: "CategoiesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoiesCollectionViewCell")
       }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return advertisementsListViewModel.categoryListViewModel.categoryViewModels.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
          return CGSize(width: 120.0, height: 120.0)
      }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoiesCollectionViewCell", for: indexPath) as! CategoiesCollectionViewCell
        cell.item = advertisementsListViewModel.categoryListViewModel.categoryViewModels[indexPath.row]
        return cell
    }
    
    
}
