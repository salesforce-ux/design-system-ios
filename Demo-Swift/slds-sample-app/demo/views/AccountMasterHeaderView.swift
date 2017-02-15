// Copyright (c) 2015-present, salesforce.com, inc. All rights reserved
// Licensed under BSD 3-Clause - see LICENSE.txt or git.io/sfdc-license

import UIKit

class AccountMasterHeaderView: AccountHeaderView {
    
    var headerSubText = UILabel()
    var headerDownArrow = UIImageView()
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func makeLayout() {
        super.makeLayout()
        headerTitle.text = "My Accounts"
        
        headerDownArrow = UIImageView(image: UIImage.sldsUtilityIcon(.chevrondown, withSize: SLDSSquareIconUtilitySmall))
        
        self.addSubview(headerDownArrow)
        headerDownArrow.constrainRightOf(self.headerTitle,
                                         yAlignment: .center,
                                         xOffset: 15,
                                         yOffset: 2)
        
        headerSubText = UILabel()
        headerSubText.text = "5 items, sorted by Account Name"
        headerSubText.font = UIFont.sldsFont(.regular, with: .small)
        headerSubText.textColor = UIColor.sldsTextColor(.colorTextDefault)
        
        self.addSubview(headerSubText)
        headerSubText.constrainBelow(self.headerTitle,
                                     xAlignment: .left,
                                     yOffset: 2)
    }
}
