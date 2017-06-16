// Copyright (c) 2015-present, salesforce.com, inc. All rights reserved
// Licensed under BSD 3-Clause - see LICENSE.txt or git.io/sfdc-license

import UIKit

class AccountMasterCell: UITableViewCell {
    
    let labelFont = UIFont.sldsFont(.regular, with: .medium)
    let labelColor = UIColor.sldsTextColor(.colorTextActionLabel)!
    let valueColor = UIColor.sldsTextColor(.colorTextDefault)!
    
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
    
    func applyStyle( target : UILabel, color : UIColor ) {
        //target.font = self.labelFont
        //target.textColor = color
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func makeLayout() {
        
        self.applyStyle(target: accountName, color: self.valueColor)
        self.addSubview(accountName)
        
        stateLabel.text = "Billing State:"
        self.applyStyle(target: stateLabel, color: self.labelColor)
        self.addSubview(stateLabel)
        
        phoneLabel.text = "Phone:"
        self.applyStyle(target: phoneLabel, color: self.labelColor)
        self.addSubview(phoneLabel)
        
        typeLabel.text = "Type:"
        self.applyStyle(target: typeLabel, color: self.labelColor)
        self.addSubview(typeLabel)
        
        ownerLabel.textColor = labelColor
        self.applyStyle(target: ownerLabel, color: self.labelColor)
        self.addSubview(ownerLabel)
        
        self.applyStyle(target: stateValue, color: self.valueColor)
        self.addSubview(stateValue)
        
        self.applyStyle(target: phoneValue, color: self.valueColor)
        self.addSubview(phoneValue)
        
        self.applyStyle(target: typeValue, color: self.valueColor)
        self.addSubview(typeValue)
        
        self.applyStyle(target: ownerValue, color: self.valueColor)
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
