//
//  IconViewController.swift
//  slds-sample-app
//
//  Created by John Earle on 12/1/16.
//  Copyright © 2016 John Earle. All rights reserved.
//

import UIKit

class AccountContainerViewController: UIViewController, ItemBarDelegate {
    
    var header = UIView()
    var headerIcon = UIImageView()
    var headerTitle = UILabel()
    var headerSubText = UILabel()
    var headerDownArrow = UIImageView()
    
    var tableViewController = AccountListViewController()
    var actionItems : Array<ActionItem>!
    
    var actionBar = ActionBar()
    
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        actionBar.delegate = self
        
        actionItems = [
            ActionItem(label: "Filter", iconId: .filter),
            ActionItem(label: "Sort", iconId: .sort),
            ActionItem(label: "New", iconId: .new)
        ]
        
        header = AccountHeaderView()
        
        self.view.addSubview(header)
        self.view.constrainChild(header,
                                 xAlignment: .center,
                                 yAlignment: .top,
                                 width: self.view.frame.width,
                                 height: 80,
                                 yOffset: 64)

        self.view.addSubview(tableViewController.tableView)
        
        tableViewController.tableView.constrainBelow(header,
                                                     xAlignment: .left,
                                                     width: self.view.frame.width,
                                                     height: self.view.frame.height - 208)
        
        self.view.addSubview(actionBar)
        self.view.constrainChild(actionBar,
                                 xAlignment: .center,
                                 yAlignment: .bottom,
                                 width: self.view.frame.width,
                                 height: 64)
        
        for a in actionItems {
            actionBar.addButton(actionItem: a)
        }
        
        self.view.backgroundColor = UIColor.white
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func itemBar(_ itemBar: ItemBar, didSelectItemAt index: NSInteger) {
        if itemBar == actionBar {
            // do something with the selection at index
        }
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
}
