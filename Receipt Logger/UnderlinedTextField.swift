//
//  UnderlinedTextField.swift
//  Receipt Logger
//
//  Created by Louise on 5/26/19.
//  Copyright © 2019 louise. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

extension SkyFloatingLabelTextField {
    
    func setProperties(props: SFTextFieldProps) {
        
        if let textColor = props.textColor {
            self.textColor = textColor
        }
        
        if let placeholderColor = props.placeholderColor {
            self.placeholderColor = placeholderColor
        }
        
        if let titleColor = props.titleColor {
            self.titleColor = titleColor
        }
        
        if let lineColor = props.lineColor {
            self.lineColor = lineColor
        }
        
        if let selectedTitleColor = props.selectedTitleColor {
            self.selectedTitleColor = selectedTitleColor
        }
        
        if let selectedLineColor = props.selectedLineColor {
            self.selectedLineColor = selectedLineColor
        }
        
        if let placeholderText = props.placeHolderText {
            self.placeholder = placeholderText
        }
        
        
        
        
        
        
        
        
        
    }
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
}

