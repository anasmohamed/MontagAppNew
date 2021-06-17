//
//  AdvertisementsViewController.swift
//  MontagApp
//
//  Created by no one on 02/06/2021.
//

import UIKit

class AdvertisementsViewController: UIViewController {
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var categriesCollectionView: UICollectionView!
    @IBOutlet weak var advertisementsTableView: UITableView!
    @IBOutlet weak var addSignBtn: UIButton!
    @IBOutlet weak var addAdveretisementBtn: UIButton!
    @IBOutlet weak var addYourAdvertisementView: UIView!
    let advertisementsListViewModel = AdvertisementsListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addYourAdvertisementView.layer.cornerRadius = 10
        addAdveretisementBtn.roundCorners([.topLeft,.bottomLeft], radius: 5)
        addSignBtn.roundCorners([.topRight,.bottomRight], radius: 5)
        advertisementsTableView.delegate = self
        advertisementsTableView.dataSource = self
        categriesCollectionView.delegate = self
        categriesCollectionView.dataSource = self
        setupTableView()
        setupCollectionView()
        bindData()
        fetchData()
        handeIsUserLogin()
        // Do any additional setup after loading the view.
    }
    func handeIsUserLogin()
    {
        
        if !(UserDefaults.standard.string(forKey: "token")?.isEmpty ?? true){
            
        }
    }
    func bindData() {
        advertisementsListViewModel.reloadTableView.bind {_ in
//            LoadingIndicatorView.hide()
            self.indicator.stopAnimating()
            self.advertisementsTableView.reloadData()
        }}
    func fetchData() {
//        LoadingIndicatorView.show()
        indicator.startAnimating()
        advertisementsListViewModel.fetchData()
       }
       
       
    @IBAction func menuBtnDidTapped(_ sender: Any) {
        let sideMenuStoryboard = UIStoryboard(name: "advertisementsView", bundle: nil)
        if !(UserDefaults.standard.string(forKey: "token")!.isEmpty){
            let sideMenuViewController = sideMenuStoryboard.instantiateViewController(identifier: "LoginSideMenuNavigationController") as! UINavigationController
            self.present(sideMenuViewController, animated: true)

        }else{
            let sideMenuViewController = sideMenuStoryboard.instantiateViewController(identifier: "SideMenuNavigationController") as! UINavigationController
            self.present(sideMenuViewController, animated: true)
        }
       

    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    @IBAction func addAdveretisementBtnDidTapped(_ sender: Any) {
    }
    
}
extension UIView {
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
}

