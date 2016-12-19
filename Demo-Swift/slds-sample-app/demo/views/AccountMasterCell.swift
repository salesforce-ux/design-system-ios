/*
 Copyright (c) 2016, salesforce.com, inc. All rights reserved.
 Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
 Neither the name of salesforce.com, inc. nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

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
            self.phoneValue.text = dataProvider?.phone
            self.typeValue.text = dataProvider?.type.rawValue
            self.ownerValue.text = dataProvider?.owner
        }
    }
    
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        stateLabel.text = "Billing State:"
        phoneLabel.text = "Phone:"
        typeLabel.text = "Type:"
        ownerLabel.text = "Owner:"
        
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
        
        let labelColor = UIColor.sldsColorText(.actionLabel)
        let valueColor = UIColor.sldsColorText(.default)
        
        self.addSubview(accountName)
        self.addSubview(stateLabel)
        self.addSubview(phoneLabel)
        self.addSubview(typeLabel)
        self.addSubview(ownerLabel)
        
        accountName.font = font
        accountName.textColor = valueColor
        
        stateLabel.font = font
        phoneLabel.font = font
        typeLabel.font = font
        ownerLabel.font = font
        
        stateLabel.textColor = labelColor
        phoneLabel.textColor = labelColor
        typeLabel.textColor = labelColor
        ownerLabel.textColor = labelColor
        
        stateValue.textColor = valueColor
        phoneValue.textColor = valueColor
        typeValue.textColor = valueColor
        ownerValue.textColor = valueColor
        
        stateValue.font = font
        phoneValue.font = font
        typeValue.font = font
        ownerValue.font = font
        
        self.addSubview(stateValue)
        self.addSubview(phoneValue)
        self.addSubview(typeValue)
        self.addSubview(ownerValue)
        
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
