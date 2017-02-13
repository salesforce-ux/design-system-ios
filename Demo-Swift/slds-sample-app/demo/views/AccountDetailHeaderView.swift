// Copyright (c) 2017, salesforce.com, inc. All rights reserved
// Licensed under BSD 3-Clause - see LICENSE.txt or git.io/sfdc-license

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
