//
//  TableViewController.swift
//  MontagApp
//
//  Created by no one on 04/06/2021.
//

import UIKit
import SideMenu

class SideMenuTableViewController: UITableViewController {
    @IBOutlet weak var buttonTwo : UIView!
    @IBOutlet weak var fixedPages : UIView!
    @IBOutlet weak var myAdsView: UIView!
    @IBOutlet weak var messagesView: UIView!
    @IBOutlet weak var profilePageView: UIView!
    @IBOutlet weak var notfiicationView: UIView!
    @IBOutlet weak var howWeAre : UIView!
    @IBOutlet weak var blackListView: UIView!
    @IBOutlet weak var favoriteView: UIView!
    @IBOutlet weak var callUs : UIView!
    @IBOutlet weak var signUIVIew: UIView!
    @IBOutlet weak var showFollowersView: UIView!
    @IBOutlet weak var signInBtn: UIView!
    @IBOutlet weak var logoutView: UIView!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)


        if let signInView = signUIVIew {
            signInView.layer.cornerRadius = 20
        }
        buttonTwo.layer.cornerRadius = 20
        howWeAre.layer.cornerRadius = 20
        fixedPages.layer.cornerRadius = 20
        callUs.layer.cornerRadius = 20
        if let notfiicationView = notfiicationView   {
            notfiicationView.layer.cornerRadius = 20
            profilePageView.layer.cornerRadius = 20
            blackListView.layer.cornerRadius = 20
            logoutView.layer.cornerRadius = 20
            messagesView.layer.cornerRadius = 20
            favoriteView.layer.cornerRadius = 20
            showFollowersView.layer.cornerRadius = 20
            myAdsView.layer.cornerRadius = 20
        }
        

        // refresh cell blur effect in case it changed
        tableView.reloadData()
        
        guard let menu = navigationController as? SideMenuNavigationController, menu.blurEffectStyle == nil else {
            return
        }
        tableView.register(UITableViewVibrantCell.self, forCellReuseIdentifier: "UITableViewVibrantCell")
        
        // Set up a cool background image for demo purposes
        //        let imageView = UIImageView(image: #imageLiteral(resourceName: "saturn"))
        //        imageView.contentMode = .scaleAspectFit
        //        imageView.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        //        tableView.backgroundView = imageView
    }
 
    @IBAction func signInBtnDidTapped(_ sender: Any) {
        let loginViewStorboard = UIStoryboard(name: "LoginView", bundle: nil)
        let loginViewController = loginViewStorboard.instantiateViewController(identifier: "LoginViewController") as! LoginViewController
        
        //        loginViewController.modalPresentationStyle = .fullScreen
        let navigationController = UINavigationController.init(rootViewController: loginViewController)
        
        navigationController.modalPresentationStyle = .fullScreen
        
        self.present(navigationController, animated: true, completion: nil)
        //        self.present(loginViewController, animated: true, completion: nil)
    }
    
    @IBAction func myAdsBtnDidTapped(_ sender: Any) {
        let myAdsViewStorboard = UIStoryboard(name: "MyAddsView", bundle: nil)
        let myAdsViewController = myAdsViewStorboard.instantiateViewController(identifier: "MyAddsViewController") as! MyAddsViewController
        
        //        loginViewController.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(myAdsViewController, animated: true)
    }
    
    @IBAction func signoutBtnDidTapped(_ sender: Any) {
        let loginViewStorboard = UIStoryboard(name: "LoginView", bundle: nil)
        let loginViewController = loginViewStorboard.instantiateViewController(identifier: "LoginViewController") as! LoginViewController
        
        //        loginViewController.modalPresentationStyle = .fullScreen
//        let navigationController = UINavigationController.init(rootViewController: loginViewController)
        UserDefaults.standard.removeObject(forKey: "id")
        UserDefaults.standard.removeObject(forKey: "token")
        UserDefaults.standard.removeObject(forKey: "phone")
        UserDefaults.standard.removeObject(forKey: "email")

//        navigationController.modalPresentationStyle = .fullScreen
        
        self.navigationController?.pushViewController(loginViewController, animated: true)
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView, cellForRowAt: indexPath) as! UITableViewVibrantCell
        
        if let menu = navigationController as? SideMenuNavigationController {
            cell.blurEffectStyle = menu.blurEffectStyle
        }
        
        return cell
    }
    
}
