/*
 Copyright (c) 2016, salesforce.com, inc. All rights reserved.
 Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
 Neither the name of salesforce.com, inc. nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

import UIKit

class AccountDetailHeaderView: AccountHeaderView, ItemBarDelegate {
    
    var accountType = UILabel()
    var phoneNumber = UILabel()
    var url = UILabel()
    
    var tabBar = TabBar()
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    var dataProvider : AccountObject? {
        didSet {
            self.headerTitle.text = dataProvider?.name
            self.accountType.text = (dataProvider?.type.rawValue)! + " ・ "
            self.phoneNumber.text = (dataProvider?.phone)!  + " ・"
            self.url.text = dataProvider?.url
        }
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func makeLayout() {
        super.makeLayout()
        
        tabBar.delegate = self
        
        self.headerTitle.font = UIFont.sldsFont(.regular, with: .medium)
        
        accountType.font = UIFont.sldsFont(.regular, with: .small)
        accountType.textColor = UIColor.sldsTextColor(.colorTextDefault)
        
        phoneNumber.font = UIFont.sldsFont(.regular, with: .small)
        phoneNumber.textColor = UIColor.sldsTextColor(.colorTextLink)
        
        url.font = UIFont.sldsFont(.regular, with: .small)
        url.textColor = UIColor.sldsTextColor(.colorTextLink)
        
        self.addSubview(accountType)
        accountType.constrainBelow(self.headerTitle,
                                   xAlignment: .left,
                                   yOffset: 2)
        
        self.addSubview(phoneNumber)
        phoneNumber.constrainRightOf(accountType,
                                     yAlignment: .center,
                                     xOffset: 2)
        
        self.addSubview(url)
        url.constrainBelow(self.accountType,
                                   xAlignment: .left,
                                   yOffset: 0)
        
        tabBar.addTab(withLabelString: "feed")
        tabBar.addTab(withLabelString: "details")
        tabBar.addTab(withLabelString: "related")
        
        tabBar.backgroundColor = UIColor.sldsBackgroundColor(.colorBackground)
        
        self.addSubview(tabBar)
    }
    
    override func layoutSubviews() {
        self.constrainChild(tabBar,
                            xAlignment: .center,
                            yAlignment: .bottom,
                            width: self.frame.width,
                            height: 30)
        
                tabBar.moveUnderscore(1)
    }
    
    // MARK: - TabBar delegate
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func itemBar(_ itemBar: ItemBar, didSelectItemAt index: NSInteger) {
        
    }
}
