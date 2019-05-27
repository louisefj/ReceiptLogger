//
//  ReceiptCategoriesViewController.swift
//  Receipt Logger
//
//  Created by Louise on 5/27/19.
//  Copyright © 2019 louise. All rights reserved.
//

import UIKit

class ReceiptCategoriesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CategoryCellDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var newCategoryText: String?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath) as! CategoryCell
        
        cell.delegate = self
        
        return cell
    }
    
    func didTapIn(for cell: CategoryCell) {
        cell.delegate = nil
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self

        // Do any additional setup after loading the view.
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
