// Copyright (c) 2015-present, salesforce.com, inc. All rights reserved
// Licensed under BSD 3-Clause - see LICENSE.txt or git.io/sfdc-license

import UIKit

class AccountDetailViewController: UIViewController {
    
    var header = AccountDetailHeaderView()
    
    var tableViewController = AccountDetailListViewController()
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    var dataProvider : AccountObject? {
        didSet {
            header.dataProvider = self.dataProvider
            tableViewController.dataProvider = self.dataProvider
        }
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        self.view.addSubview(header)
        self.view.constrainChild(header,
                                 xAlignment: .left,
                                 yAlignment: .top,
                                 width: self.view.frame.width,
                                 height: 120,
                                 yOffset: 64)
        
        self.view.addSubview(tableViewController.view)
        self.tableViewController.view.constrainBelow(self.header,
                                                     xAlignment: .center,
                                                     width: self.view.frame.width,
                                                     height: self.view.frame.height - 240)
        
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
}
