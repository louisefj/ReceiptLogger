//
//  LogInViewController.swift
//  Receipt Logger
//
//  Created by Louise on 5/26/19.
//  Copyright © 2019 louise. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import SkyFloatingLabelTextField

class LogInViewController: UIViewController {

    @IBOutlet weak var emailTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var passwordTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var logInButton: RoundedButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        logInButton.backgroundColor = UIColor.clear
        
//        var textFieldProps = SFTextFieldProps()
//        textFieldProps.lineColor = UIColor.white
//        //textFieldProps.placeholderColor = UIColor.lightText
//        textFieldProps.selectedLineColor = UIColor.white
//        //textFieldProps.selectedTitleColor = UIColor.white
//        textFieldProps.textColor = UIColor.white
//        //textFieldProps.titleColor = UIColor.white
//
//        textFieldProps.placeHolderText = "EMAIL"
//        emailTextField.setProperties(props: textFieldProps)
//
//        textFieldProps.placeHolderText = "PASSWORD"
//        passwordTextField.setProperties(props: textFieldProps)
//
//        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if FBManager.instance.userIsLoggedIn {
            emailTextField.text = Auth.auth().currentUser?.email
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
    @IBAction func cancelTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func logInTapped(_ sender: Any) {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        FBManager.instance.logIn(withEmail: email, password: password) { (success) in
            if success {
                self.performSegue(withIdentifier: "LogInSuccessfulSegue", sender: self)
            } else {
                print("Login unsuccessful")
            }
        }
    }
}
