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
    @IBOutlet weak var howWeAre : UIView!
    @IBOutlet weak var callUs : UIView!
    @IBOutlet weak var signUIVIew: UIView!
    @IBOutlet weak var signInBtn: UIButton!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        signUIVIew.layer.cornerRadius = 20
        buttonTwo.layer.cornerRadius = 20
        howWeAre.layer.cornerRadius = 20
        fixedPages.layer.cornerRadius = 20
        callUs.layer.cornerRadius = 20
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
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView, cellForRowAt: indexPath) as! UITableViewVibrantCell
        
        if let menu = navigationController as? SideMenuNavigationController {
            cell.blurEffectStyle = menu.blurEffectStyle
        }
        
        return cell
    }
    
}
