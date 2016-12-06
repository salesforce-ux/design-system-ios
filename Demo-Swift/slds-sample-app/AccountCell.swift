/*
 Copyright (c) 2016, salesforce.com, inc. All rights reserved.
 Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
 Neither the name of salesforce.com, inc. nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

import UIKit

class AccountCell: UITableViewCell {
    
    var accountName = UILabel()
    var stateLabel = UILabel()
    var phoneLabel = UILabel()
    var typeLabel = UILabel()
    var ownerLabel = UILabel()
    
    var stateValue = UILabel()
    var phoneValue = UILabel()
    var typeValue = UILabel()
    var ownerValue = UILabel()
    
    var accountObj: AccountObject!
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    var dataProvider : AccountObject {
        get {
            return accountObj
        }
        set {
            self.accountName.text = newValue.name
            self.stateValue.text = newValue.state
            self.phoneValue.text = newValue.phone
            self.typeValue.text = newValue.type.rawValue
            self.ownerValue.text = newValue.owner
            self.accountObj = newValue
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
        self.addSubview(accountName)
        self.addSubview(stateLabel)
        self.addSubview(phoneLabel)
        self.addSubview(typeLabel)
        self.addSubview(ownerLabel)
        
        self.addSubview(stateValue)
        self.addSubview(phoneValue)
        self.addSubview(typeValue)
        self.addSubview(ownerValue)
        
        self.constrain(accountName, inside: self, xAlignment: .left, yAlignment: .top, xOffset: 5, yOffset: 5)
        self.constrain(stateLabel, inside: self, xAlignment: .left, yAlignment: .top, xOffset: 5, yOffset: 5)
        self.constrain(accountName, inside: self, xAlignment: .left, yAlignment: .top, xOffset: 5, yOffset: 5)
        self.constrain(accountName, inside: self, xAlignment: .left, yAlignment: .top, xOffset: 5, yOffset: 5)
    }
}
