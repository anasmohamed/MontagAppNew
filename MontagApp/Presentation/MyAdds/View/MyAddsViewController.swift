//
//  MyAddsViewController.swift
//  MontagApp
//
//  Created by no one on 23/06/2021.
//

import UIKit
import Toast_Swift
class MyAddsViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var areaPickerVIew: UIPickerView!
    @IBOutlet weak var resultsAddsTableView: UITableView!
    @IBOutlet weak var msinClassficationPikerView: UIPickerView!
    var areaPickerData: [String] =  ["المنطقة 6", "المنطقة 5", "المنطقة 4", "المنطقة 3", "المنطقة 2", "المنطقة 1"]
    var mainClassificationPickerData: [String] = ["التصنيف 6", "التصنيف 5", "التصنيف 4", "التصنيف 3", "التصنيف 2", "التصنيف 1"]
    
    let myAdsViewModel = MyAdsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.areaPickerVIew.delegate = self
        self.areaPickerVIew.dataSource = self
        self.msinClassficationPikerView.delegate = self
        self.msinClassficationPikerView.dataSource = self
        resultsAddsTableView.delegate = self
        resultsAddsTableView.dataSource = self
        setupTableView()
        fetchData()
        bindData()

        

        // Do any additional setup after loading the view.
    }
//    func update(userId: String,apiToken:String)  {
//        myAdsViewModel.update(userId: userId, apiToken:apiToken )
//    }
    func bindData() {
        myAdsViewModel.reloadTableView.bind {_ in
            
            self.resultsAddsTableView.reloadData()
        }
        myAdsViewModel.message.bind{
            self.view.makeToast($0, duration: 3.0, position: .bottom)

        }
    }
    func fetchData() {
        self.myAdsViewModel.update(userId: UserDefaults.standard.string(forKey: "id")!, apiToken: UserDefaults.standard.string(forKey: "token")!)
        myAdsViewModel.fetchData()
    }
    func setupTableView() {
        resultsAddsTableView.register(UINib(nibName: "MyAddsTableViewCell", bundle: nil), forCellReuseIdentifier: "MyAddsTableViewCell")
        resultsAddsTableView.backgroundColor = UIColor.init(red:234.0/255.0 , green: 234.0/255.0, blue: 234.0/255.0, alpha: 1.0)
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    @IBOutlet weak var detailsTextVIew: UITextView!
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == areaPickerVIew{
            return areaPickerData.count
            
        }else if pickerView == msinClassficationPikerView{
            return mainClassificationPickerData.count
        }else{
            return 0
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int)-> String? {
        if pickerView == areaPickerVIew{
            return areaPickerData[row]
            
        }else if pickerView == msinClassficationPikerView{
            return mainClassificationPickerData[row]
        }
        else{
            return mainClassificationPickerData[row]
            
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myAdsViewModel.numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"MyAddsTableViewCell" , for: indexPath) as! MyAddsTableViewCell
        cell.item = myAdsViewModel.getData(index: indexPath.row)
        return cell
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
