//
//  AddAdsController + CollectionView.swift
//  MontagApp
//
//  Created by no one on 28/06/2021.
//

import Foundation
import UIKit
import OpalImagePicker
import Photos
//MARK:- CollectionView Implementaion
extension AddAdvertisementViewController : UICollectionViewDelegate , UICollectionViewDataSource ,OpalImagePickerControllerDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if section == 0 {
            return myArr.count
        } else {
            return adsPhotos.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddAdsCollectionViewCell", for: indexPath) as! AddAdsCollectionViewCell
        
        if indexPath.section == 0{
            cell.addAdsImage.image = myArr[indexPath.row]
            
        }else{
            cell.addAdsImage.image = adsPhotos[indexPath.row]
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            
            let imagePicker = OpalImagePickerController()
            imagePicker.imagePickerDelegate = self
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePicker(_ picker: OpalImagePickerController, didFinishPickingAssets assets: [PHAsset]) {
        
        for asset in assets
        {
            self.adsPhotos.append(getAssetThumbnail(asset: asset, size: 20))
            
        }
        adsPhotoCollectionView.reloadData()
        self.dismiss(animated: false, completion: nil)
    }
    func getAssetThumbnail(asset: PHAsset, size: CGFloat) -> UIImage {
            let retinaScale = UIScreen.main.scale
            let retinaSquare = CGSize(width: size * retinaScale, height: size * retinaScale)
            let cropSizeLength = min(asset.pixelWidth, asset.pixelHeight)
            let square = CGRect(x: 0, y: 0, width: CGFloat(cropSizeLength), height: CGFloat(cropSizeLength))
            let cropRect = square.applying(CGAffineTransform(scaleX: 1.0/CGFloat(asset.pixelWidth), y: 1.0/CGFloat(asset.pixelHeight)))
            
            let manager = PHImageManager.default()
            let options = PHImageRequestOptions()
            var thumbnail = UIImage()
            
            options.isSynchronous = true
            options.deliveryMode = .highQualityFormat
            options.resizeMode = .exact
            
            options.normalizedCropRect = cropRect
            
            manager.requestImage(for: asset, targetSize: retinaSquare, contentMode: .aspectFit, options: options, resultHandler: {(result, info)->Void in
                thumbnail = result!
            })
            return thumbnail
        }

}


extension PHAsset {
    
    var image : UIImage {
        var thumbnail = UIImage()
        let imageManager = PHCachingImageManager()
        imageManager.requestImage(for: self, targetSize: CGSize(width: 100, height: 100), contentMode: .aspectFit, options: nil, resultHandler: { image, _ in
            thumbnail = image!
        })
        return thumbnail
    }
}

