//
//  CategoryCell.swift
//  Receipt Logger
//
//  Created by Louise on 5/27/19.
//  Copyright © 2019 louise. All rights reserved.
//

import UIKit

protocol CategoryCellDelegate {
    func didTapIn(for cell: CategoryCell)
}

class CategoryCell: UITableViewCell {

    @IBOutlet weak var categoryName: UILabel!
    @IBOutlet weak var numReceipts: UILabel!
    @IBOutlet weak var tapIn: UIImageView!
    
    var delegate: CategoryCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tappedIn))
        tapIn.addGestureRecognizer(gestureRecognizer)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc private func tappedIn() {
        delegate?.didTapIn(for: self)
    }

}
