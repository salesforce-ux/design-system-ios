// Copyright (c) 2015-present, salesforce.com, inc. All rights reserved
// Licensed under BSD 3-Clause - see LICENSE.txt or git.io/sfdc-license

import UIKit

class AccountMasterCell: UITableViewCell {
    
    var accountName = UILabel()
    var stateLabel = UILabel()
    var phoneLabel = UILabel()
    var typeLabel = UILabel()
    var ownerLabel = UILabel()
    
    var stateValue = UILabel()
    var phoneValue = UILabel()
    var typeValue = UILabel()
    var ownerValue = UILabel()
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    var dataProvider : AccountObject? {
        
        didSet {
            self.accountName.text = dataProvider?.name
            self.stateValue.text = dataProvider?.state
            self.stateValue.accessibilityLabel = "Billing State " + self.stateValue.text!
            
            self.phoneValue.text = dataProvider?.phone
            self.phoneValue.accessibilityLabel = "Phone " + self.phoneValue.text!
            
            self.typeValue.text = dataProvider?.type.rawValue
            self.typeValue.accessibilityLabel = "Type " + self.typeValue.text!
            
            self.ownerValue.text = dataProvider?.owner
            self.ownerValue.accessibilityLabel = "Owner " + self.ownerValue.text!
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func makeLayout() {
        
        let font = UIFont.sldsFont(.regular, with: .medium)
        let labelColor = UIColor.sldsTextColor(.colorTextActionLabel)
        let valueColor = UIColor.sldsTextColor(.colorTextDefault)
        
        accountName.font = font
        accountName.textColor = valueColor
        self.addSubview(accountName)
        
        stateLabel.font = font
        stateLabel.textColor = labelColor
        stateLabel.text = "Billing State:"
        self.addSubview(stateLabel)
        
        phoneLabel.font = font
        phoneLabel.textColor = labelColor
        phoneLabel.text = "Phone:"
        self.addSubview(phoneLabel)
        
        typeLabel.font = font
        typeLabel.textColor = labelColor
        typeLabel.text = "Type:"
        self.addSubview(typeLabel)
        
        ownerLabel.text = "Owner:"
        ownerLabel.font = font
        ownerLabel.textColor = labelColor
        self.addSubview(ownerLabel)
        
        stateValue.font = font
        stateValue.textColor = valueColor
        self.addSubview(stateValue)
        
        phoneValue.font = font
        phoneValue.textColor = valueColor
        self.addSubview(phoneValue)
        
        typeValue.font = font
        typeValue.textColor = valueColor
        self.addSubview(typeValue)
        
        ownerValue.font = font
        ownerValue.textColor = valueColor
        self.addSubview(ownerValue)
        
        self.accessibilityElements = [accountName, stateValue, phoneValue, typeValue, ownerValue]
        
        self.constrainChild(accountName,
                            xAlignment: .left,
                            yAlignment: .top,
                            xOffset: SLDSSpacingMedium,
                            yOffset: SLDSSpacingMedium)
        
        self.stateLabel.constrainBelow(accountName,
                                       xAlignment: .left,
                                       yOffset: 3)
        
        self.phoneLabel.constrainBelow(stateLabel,
                                       xAlignment: .left,
                                       yOffset: 1)
        
        self.typeLabel.constrainBelow(phoneLabel,
                                       xAlignment: .left,
                                       yOffset: 1)
        
        self.ownerLabel.constrainBelow(typeLabel,
                                       xAlignment: .left,
                                       yOffset: 1)
        
        // values
        
        self.stateValue.constrainRightOf(stateLabel,
                                         yAlignment: .center,
                                         xOffset: 30)
        
        self.phoneValue.constrainBelow(stateValue,
                                       xAlignment: .left,
                                       yOffset: 1)
        
        self.typeValue.constrainBelow(phoneValue,
                                       xAlignment: .left,
                                       yOffset: 1)
        
        self.ownerValue.constrainBelow(typeValue,
                                      xAlignment: .left,
                                      yOffset: 1)
        
    }
}
