//
//  SettingsViewController.swift
//  Receipt Logger
//
//  Created by Louise on 5/27/19.
//  Copyright © 2019 louise. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var logoutButton: RoundedButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logoutButton.backgroundColor = UIColor.white
        logoutButton.outlineColor = UIColor.black
        //updateLayout()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //updateLayout()
    }
    
    @IBAction func onLogout(_ sender: Any) {
        FBManager.instance.logOut()
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
