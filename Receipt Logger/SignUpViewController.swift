//
//  SignUpViewController.swift
//  Receipt Logger
//
//  Created by Louise on 5/26/19.
//  Copyright © 2019 louise. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import SkyFloatingLabelTextField

class SignUpViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var lastNameTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var emailTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var passwordTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var continueButton: RoundedButton!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        continueButton.backgroundColor = UIColor.clear
        //loadingIndicatorView.type = .ballBeat
        
//        var textFieldProps = SFTextFieldProps()
//        textFieldProps.lineColor = UIColor.white
//        textFieldProps.placeholderColor = UIColor.lightText
//        textFieldProps.selectedLineColor = UIColor.white
//        textFieldProps.selectedTitleColor = UIColor.white
//        textFieldProps.textColor = UIColor.white
//        textFieldProps.titleColor = UIColor.white
//
//        textFieldProps.placeHolderText = "FIRST NAME"
//        firstNameTextField.setProperties(props: textFieldProps)
//
//        textFieldProps.placeHolderText = "LAST NAME"
//        lastNameTextField.setProperties(props: textFieldProps)
//
//        textFieldProps.placeHolderText = "EMAIL"
//        emailTextField.setProperties(props: textFieldProps)
//        
//        textFieldProps.placeHolderText = "PASSWORD"
//        passwordTextField.setProperties(props: textFieldProps)
//
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeybard))
        view.addGestureRecognizer(tapGesture)
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.becomeFirstResponder()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.resignFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func continueTapped(_ sender: Any) {
        guard let firstName = firstNameTextField.text else { return }
        guard let lastName = lastNameTextField.text else { return }
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        //let continueButton = sender as? UIButton
       // continueButton?.setTitle("", for: .normal)
        
       // loadingIndicatorView.startAnimating()
        
        FBManager.instance.createUser(withFirstName: firstName, lastName: lastName, email: email, password: password) { (success) in
            if success {
                //self.loadingIndicatorView.stopAnimating()
                self.performSegue(withIdentifier: "SignUpSuccessfulSegue", sender: self)
            } else {
                print("Error creating user")
                //self.loadingIndicatorView.stopAnimating()
                //continueButton?.setTitle("Continue", for: .normal)
            }
        }
    }
    @IBAction func cancelTapped(_ sender: Any) {
         dismiss(animated: true, completion: nil)
    }
    
    @objc private func dismissKeybard() {
        view.endEditing(true)
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
