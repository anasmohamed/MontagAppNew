//
//  AddAdvertisementViewController.swift
//  MontagApp
//
//  Created by no one on 18/06/2021.
//

import UIKit

class AddAdvertisementViewController: UITableViewController {

    @IBOutlet weak var addVideosOrImagestn: UIButton!
    @IBOutlet weak var videoView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        videoView.layer.cornerRadius = 10
        videoView.layer.borderWidth = 1
        videoView.layer.borderColor = UIColor.gray.cgColor
        
        addVideosOrImagestn.layer.cornerRadius = 10
        addVideosOrImagestn.layer.borderWidth = 1
        addVideosOrImagestn.layer.borderColor = UIColor.gray.cgColor
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
