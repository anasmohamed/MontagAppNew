//
//  AddAdvertisementViewController.swift
//  MontagApp
//
//  Created by no one on 18/06/2021.
//

import UIKit
import SwiftyMenu
class AddAdvertisementViewController: UITableViewController,UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet weak var adsDetailsTextView: UITextView!
    @IBOutlet weak var adsVideoLinkTextField: UITextField!
    @IBOutlet weak var adsTitleTextField: UITextField!
    @IBOutlet weak var inernalClassficationPickerView: UIPickerView!
    @IBOutlet weak var subClassficationPickerView: UIPickerView!
    @IBOutlet weak var mainClassificationPickerView: UIPickerView!
    @IBOutlet weak var AdvertisementAreaDropMenu: UIPickerView!
    @IBOutlet weak var subAreaDropMenu: UIPickerView!
    @IBOutlet weak var addVideosOrImagestn: UIButton!
    @IBOutlet weak var videoView: UIView!
    
    @IBOutlet weak var adsPhotoCollectionView: UICollectionView!
    

    var userId: String = ""
    var apiToken: String = ""
    var phone : String = ""
    var adsPhotos = [UIImage]()
    var myArr :[UIImage] = []

    var areaPickerData: [String] =  ["المنطقة 6", "المنطقة 5", "المنطقة 4", "المنطقة 3", "المنطقة 2", "المنطقة 1"]
    var internalAreaPickerData: [String] =  ["المنطقة 6", "المنطقة 5", "المنطقة 4", "المنطقة 3", "المنطقة 2", "المنطقة 1"]
    var mainClassificationPickerData: [String] = ["التصنيف 6", "التصنيف 5", "التصنيف 4", "التصنيف 3", "التصنيف 2", "التصنيف 1"]
    var subcategoryPickerData: [String] = ["التصنيف 6", "التصنيف 5", "التصنيف 4", "التصنيف 3", "التصنيف 2", "التصنيف 1"]
    var internalClassificationPickerData: [String] = ["التصنيف 6", "التصنيف 5", "التصنيف 4", "التصنيف 3", "التصنيف 2", "التصنيف 1"]
    var addAdsViewModel = AddAdsViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
//        videoView.layer.cornerRadius = 10
//        videoView.layer.borderWidth = 1
//        videoView.layer.borderColor = UIColor.gray.cgColor

        myArr.append(UIImage(named: "add-image")!)
//        addVideosOrImagestn.layer.cornerRadius = 10
//        addVideosOrImagestn.layer.borderWidth = 1
//        addVideosOrImagestn.layer.borderColor = UIColor.gray.cgColor
        self.AdvertisementAreaDropMenu.delegate = self
        self.AdvertisementAreaDropMenu.dataSource = self
        self.subAreaDropMenu.delegate = self
        self.subAreaDropMenu.dataSource = self
        self.mainClassificationPickerView.delegate = self
        self.mainClassificationPickerView.dataSource = self
        self.subClassficationPickerView.delegate = self
        self.subClassficationPickerView.dataSource = self
        self.inernalClassficationPickerView.delegate = self
        self.inernalClassficationPickerView.dataSource = self
        
        detailsTextVIew.layer.borderColor = UIColor.gray.cgColor
        detailsTextVIew.layer.borderWidth = 1
        detailsTextVIew.layer.cornerRadius = 8
        self.navigationController?.navigationBar.topItem?.title = ""
        initData()
        adsPhotoCollectionView.delegate = self
        adsPhotoCollectionView.dataSource = self
        // Do any additional setup after loading the view.
    }
    func initData()  {
        guard let userId = UserDefaults.standard.string(forKey: "id"), let apiToken = UserDefaults.standard.string(forKey: "token"),let phone = UserDefaults.standard.string(forKey: "phone") else {
            return
        }
        self.userId = userId
        self.apiToken = apiToken
        self.phone = phone
        
    }
    @IBAction func addNewAdsBtnDidTapped(_ sender: Any) {
        addAdsViewModel.updateCredentials(userId: self.userId , apiToken:apiToken, title: adsTitleTextField.text!, phone: phone, city: "1", details: adsDetailsTextView.text!, mainSectionId: "1", subSectionId: "1", internalSectionId: "1", photos: adsPhotos)
        
        //Here we check user's credentials input - if it's correct we call login()
        switch addAdsViewModel.credentialsInput() {
        
        case .Correct:
            addAdsViewModel.addAds()
        case .Incorrect:
            return
        }
    }
    @IBAction func backBtnDidTapped(_ sender: Any) {
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
        
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    @IBAction func addViedoOrPhotosBtnDidTapped(_ sender: Any) {
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    @IBOutlet weak var detailsTextVIew: UITextView!
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == AdvertisementAreaDropMenu{
            return areaPickerData.count
            
        }else if pickerView == subAreaDropMenu{
            return internalAreaPickerData.count
        }else if pickerView == mainClassificationPickerView{
            return mainClassificationPickerData.count
        }
        else if pickerView == subClassficationPickerView{
            return subcategoryPickerData.count
        }
        else if pickerView == inernalClassficationPickerView{
            return internalClassificationPickerData.count
        }else{
            return 0
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int)-> String? {
        if pickerView == AdvertisementAreaDropMenu{
            return areaPickerData[row]
            
        }else if pickerView == subAreaDropMenu{
            return internalAreaPickerData[row]
        }else if pickerView == mainClassificationPickerView{
            return mainClassificationPickerData[row]
        }
        else if pickerView == subClassficationPickerView{
            return subcategoryPickerData[row]
        }
        else if pickerView == inernalClassficationPickerView{
            return internalClassificationPickerData[row]
        }
        else{
            return internalClassificationPickerData[row]
            
        }
    }
}
