// Copyright (c) 2015-present, salesforce.com, inc. All rights reserved
// Licensed under BSD 3-Clause - see LICENSE.txt or git.io/sfdc-license

import UIKit

class AccountDetailCell: UITableViewCell {
    
    var label = UILabel()
    var value = UILabel()
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    var dataProvider : (label : String, value : String)? {
        
        didSet {
            self.label.text = dataProvider?.label
            self.value.text = dataProvider?.value
        }
    }
    
    
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
    
    func makeLayout() {
        
        let font = UIFont.sldsFont(.regular, with: .medium)
        let labelColor = UIColor.sldsTextColor(.colorTextActionLabel)
        let valueColor = UIColor.sldsTextColor(.colorTextDefault)
        
        label.font = font
        label.textColor = labelColor
        self.addSubview(label)
        
        value.font = font
        value.textColor = valueColor
        self.addSubview(value)
        
        self.constrainChild(label,
                            xAlignment: .left,
                            yAlignment: .top,
                            xOffset: SLDSSpacingMedium,
                            yOffset: SLDSSpacingMedium)
        
        self.value.constrainBelow(label,
                                  xAlignment: .left,
                                  yOffset: 1)
    }
}
