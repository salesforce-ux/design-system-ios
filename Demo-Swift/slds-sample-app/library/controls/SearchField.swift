//
//  SearchFieldView.swift
//  slds-sample-app
//
//  Created by John Earle on 11/30/16.
//  Copyright © 2016 John Earle. All rights reserved.
//

import Foundation

class SearchField: UITextField {
    
    let padding = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16);
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        applyStyle()
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func focus(_ shouldFocus: Bool) {
        if shouldFocus {
            self.layer.borderColor = UIColor.sldsColorBorder(.inputDisabled).cgColor
        } else {
            self.layer.borderColor = UIColor.sldsColorBorder(.input).cgColor
        }
    }

    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func applyStyle() {
        self.backgroundColor = UIColor.white
        self.layer.borderColor = UIColor.sldsColorBorder(.input).cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 16
        self.placeholder = "Search"
        self.font = UIFont.sldsFont(.regular, with: .medium)
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
}
