//
//  LogoViewController.swift
//  Receipt Logger
//
//  Created by Louise on 5/26/19.
//  Copyright © 2019 louise. All rights reserved.
//

import UIKit

class LogoViewController: UIViewController {

    @IBOutlet weak var logInButton: RoundedButton!
    @IBOutlet weak var signUpButton: RoundedButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signUpButton.backgroundColor = UIColor.clear
        //signUpButton.outlineColor = UIColor.white
        logInButton.backgroundColor = UIColor.white
        //logInButton.outlineColor = UIColor.white
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
