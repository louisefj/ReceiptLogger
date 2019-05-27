//
//  DBManager.swift
//  Receipt Logger
//
//  Created by Louise on 5/26/19.
//  Copyright © 2019 louise. All rights reserved.
//

import Foundation
import Firebase

let DB_ROOT = Database.database().reference()

class DBManager {
    
    static let instance = DBManager()
    
    private var _REF_ROOT = DB_ROOT
    private var _REF_USERS = DB_ROOT.child("users")
    private var _REF_CATEGORIES = DB_ROOT.child("categories")
    
    
    var REF_USERS: DatabaseReference {
        return _REF_USERS
    }
    
    var REF_CATEGORIES: DatabaseReference {
        return _REF_CATEGORIES
    }
    
    func createDBUser(uid: String, userData: Dictionary<String, Any>) {
        REF_USERS.child(uid).updateChildValues(userData)
    }
    
    func createDBCategory(name: String) {
        REF_CATEGORIES.updateChildValues([name:name])
    }
    
}

