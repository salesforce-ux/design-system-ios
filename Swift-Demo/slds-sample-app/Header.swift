//
//  ViewController.swift
//  slds-sample-app
//
//  Created by John Earle on 11/7/16.
//  Copyright © 2016 John Earle. All rights reserved.
//

import UIKit
import DesignSystem

class Header: UIView {
    
    // MARK: Component initialization
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override init (frame : CGRect) {
        super.init(frame : frame)
        self.makeLayout()
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    convenience init () {
        self.init(frame:CGRect.zero)
        self.makeLayout()
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.makeLayout()
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func makeLayout() {
        self.backgroundColor = UIColor.sldsBackgroundColor(SLDSColorBgType.brand)
        
        // context label
        let contextLabel = UILabel()
        contextLabel.text = "Accounts"
        contextLabel.textColor = UIColor.sldsColorText(.actionLabel)
        contextLabel.font = UIFont.sldsFontRegular(with: SLDSFontSizeType.medium)
        self.addSubview(contextLabel)
        self.addConstraints(ConstraintsHelper.addConstraints(item: contextLabel, toItem: self, xAlignment: "center", yAlignment: "center", xOffset: 0, yOffset: 10))
        
        let addButton = UIButton()
        addButton.setImage(UIImage.sldsIconUtility(SLDSIconUtilType.utilityAdd, with: UIColor.white, andSize: 18), for: UIControlState.normal)
        self.addSubview(addButton)
        self.addConstraints(ConstraintsHelper.addConstraints(item: addButton, toItem: self, xAlignment: "right", yAlignment: "center", xOffset: -20, yOffset: 10))
    }
}

