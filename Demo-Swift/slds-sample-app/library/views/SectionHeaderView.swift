// Copyright (c) 2017, salesforce.com, inc. All rights reserved
// Licensed under BSD 3-Clause - see LICENSE.txt or git.io/sfdc-license

import UIKit

//––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

class SectionHeaderView: UITableViewHeaderFooterView {

    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func willMove(toSuperview newSuperview: UIView?) {
        self.applyStyle()
        if let superview = newSuperview {
            super.willRemoveSubview(superview)
        }
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func applyStyle() {
        self.textLabel?.font = UIFont.sldsFont(.regular, with: .medium)
        self.contentView.backgroundColor = UIColor.sldsBackgroundColor(.colorBackgroundRowActive)
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
}
