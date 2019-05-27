//
//  AddCategoryController.swift
//  Receipt Logger
//
//  Created by Louise on 5/27/19.
//  Copyright © 2019 louise. All rights reserved.
//

import UIKit

class AddCategoryController: UIAlertController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func presetAlert(from sourceVC: UIViewController) {
        let alertController = UIAlertController(title: "Create New Category", message: "", preferredStyle: UIAlertController.Style.alert)
        
        let sendAction = UIAlertAction(title: "Create", style: UIAlertAction.Style.default, handler: { alert -> Void in
            let firstTextField = alertController.textFields![0] as UITextField
            (sourceVC as! ReceiptCategoriesViewController).newCategoryText = firstTextField.text
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: {
            (action : UIAlertAction!) -> Void in })
        
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter Category Name"
        }
        
        alertController.addAction(sendAction)
        alertController.addAction(cancelAction)
        
        sourceVC.present(alertController, animated: true, completion: nil)
    }

}
