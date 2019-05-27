//
//  FBManager.swift
//  Receipt Logger
//
//  Created by Louise on 5/26/19.
//  Copyright © 2019 louise. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth

private struct UserInfo {
    var firstName: String
    var lastName: String
}

class FBManager {
    static let instance = FBManager()
    
    private var userInfo: UserInfo!
    
    var firstName: String {
        return userInfo.firstName
    }
    
    var lastName: String {
        return userInfo.lastName
    }
    
    var userIsLoggedIn: Bool {
        get { return Auth.auth().currentUser != nil }
    }
    
    var userID: String {
        get {return Auth.auth().currentUser!.uid}
    }
    
    func createUser(withFirstName firstName: String, lastName: String, email: String, password: String, completion:@escaping (Bool) -> ()) {
        Auth.auth().createUser(withEmail: email, password: password) { (authDataResult, error) in
            if error != nil {
                print("Error signing up \(error!.localizedDescription)")
                return
            } else {
                print("User successfully created")
                let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                changeRequest?.displayName = firstName + " " + lastName
                changeRequest?.commitChanges(completion: { (error) in
                    if error == nil {
                        print("User name successfully changed")
                        DBManager.instance.createDBUser(uid: Auth.auth().currentUser!.uid, userData: ["first name": firstName, "last name": lastName, "email": email, "password": password])
                        completion(true) // At this point VC will call perform segue
                    } else {
                        print("Error changing user name \(error!.localizedDescription)")
                        completion(false)
                        return
                    }
                })
            }
        }
    }
    
    func logIn(withEmail email: String, password: String, completion: @escaping (Bool)->()) {
        Auth.auth().signIn(withEmail: email, password: password) { (authDataResult, error) in
            if error == nil {
                self.populateUserInfo(completion: {() in
                    completion(true)
                })
            } else {
                print("Error logging in \(error!.localizedDescription)")
                completion(false)
            }
        }
    }
    
    func logOut() {
        if Auth.auth().currentUser != nil {
            do {
                try Auth.auth().signOut()
                //logoutTasks()
                let main = UIStoryboard(name: "Main", bundle: nil)
                let logoViewController = main.instantiateViewController(withIdentifier: "LogoVC")
                let delegate = UIApplication.shared.delegate as! AppDelegate
                delegate.window?.rootViewController = logoViewController
            } catch let error as NSError {
                print("Error logging out \(error.localizedDescription)")
            }
        }
    }
    
    func populateUserInfo(completion: @escaping () -> ()) {
        print("Populating user info")
        DBManager.instance.REF_USERS.child(FBManager.instance.userID).observeSingleEvent(of: .value, with: { (snapshot) in
            let userData = snapshot.value as? NSDictionary
            let firstName = userData?["first name"] as? String ?? ""
            let lastName = userData?["last name"] as? String ?? ""

            self.userInfo = UserInfo(firstName: firstName, lastName: lastName)
            completion()
        })
    }
    
    
}
