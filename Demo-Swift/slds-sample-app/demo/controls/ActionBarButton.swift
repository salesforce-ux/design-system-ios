// Copyright (c) 2015-present, salesforce.com, inc. All rights reserved
// Licensed under BSD 3-Clause - see LICENSE.txt or git.io/sfdc-license

import UIKit

class ActionBarButton: UIButton {
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func layoutSubviews() {
        super.layoutSubviews()
        var frame = self.imageView?.frame;
        frame = CGRect(x:((self.bounds.size.width - (frame?.size.width)!) / 2), y: 8, width: (frame?.size.width)!, height: (frame?.size.height)!);
        self.imageView?.frame = frame!;
        
        frame = self.titleLabel?.frame;
        frame = CGRect(x: ((self.bounds.size.width - (frame?.size.width)!) / 2), y: self.bounds.size.height - (frame?.size.height)! - 4, width: (frame?.size.width)!, height: (frame?.size.height)!);
        self.titleLabel?.frame = frame!;
        
        // styling
        self.titleLabel?.font = UIFont.sldsFont(.regular, with: .xSmall)
        self.titleLabel?.textColor = UIColor.sldsTextColor(.colorTextActionLabel)
    }
}
