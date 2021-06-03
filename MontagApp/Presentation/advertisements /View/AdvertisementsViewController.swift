//
//  AdvertisementsViewController.swift
//  MontagApp
//
//  Created by no one on 02/06/2021.
//

import UIKit

class AdvertisementsViewController: UIViewController {
    
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
        setupTableView()
        bindData()
        fetchData()
        
        // Do any additional setup after loading the view.
    }
    func bindData() {
        advertisementsListViewModel.reloadTableView.bind {_ in
            
            self.advertisementsTableView.reloadData()
        }}
    func fetchData() {
        advertisementsListViewModel.fetchData()
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

