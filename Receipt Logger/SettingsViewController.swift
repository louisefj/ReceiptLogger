//
//  SettingsViewController.swift
//  Receipt Logger
//
//  Created by Louise on 5/27/19.
//  Copyright © 2019 louise. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var logoutButton: RoundedButton!
    @IBOutlet weak var createCategoryButton: RoundedButton!
    @IBOutlet weak var picker: UIPickerView!
    
    var pickerData: [String] = [String]()
    var newCategory: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //logoutButton.backgroundColor = UIColor.white
        //logoutButton.outlineColor = UIColor.black
        //updateLayout()
        self.picker.dataSource = self
        self.picker.delegate = self
       
        pickerData = ["Grocery", "Restaurants", "Clothes", "Bills", "Ride Share", "Miscellaneous"]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //updateLayout()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.newCategory = pickerData[row]
        //FBManager.instance.createCategory(category: newCategory) {(completion) in}
    }
    
    @IBAction func onLogout(_ sender: Any) {
        FBManager.instance.logOut()
    }
    
    @IBAction func onCreateCategory(_ sender: Any) {
        //let addCategoryController = AddCategoryController()
        //addCategoryController.presetAlert(from: self)
        FBManager.instance.createCategory(category: self.newCategory) {(completion) in}
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
