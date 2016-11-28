//
//  AccountsCell.swift
//  slds-sample-app
//
//  Created by John Earle on 11/14/16.
//  Copyright © 2016 John Earle. All rights reserved.
//

import UIKit

class BackgroundColorCell: ColorCell {
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.makeLayout()
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func updateColor(_ c:UIColor) {
        super.updateColor(c)
        backgroundExample.backgroundColor = c
    }
    
    override func makeLayout() {
        super.makeLayout()
        self.contentView.addSubview(checkeredBackground)
        checkeredBackground.addSubview(backgroundExample)
        self.contentView.addConstraints(ConstraintsHelper.addConstraints(item: checkeredBackground, toItem: self.contentView, width: 80, height:80, xAlignment: "right", yAlignment: "center", xOffset: -10, yOffset: 0))
        checkeredBackground.addConstraints(ConstraintsHelper.addConstraints(item: backgroundExample, toItem: checkeredBackground, width: 80, height:80, xAlignment: "right", yAlignment: "center", xOffset: 0, yOffset: 0))
    }
    
}
