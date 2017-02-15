// Copyright (c) 2015-present, salesforce.com, inc. All rights reserved
// Licensed under BSD 3-Clause - see LICENSE.txt or git.io/sfdc-license

import UIKit

class AccountMasterViewController: UIViewController {
    
    var header          = UIView()
    var tableViewController = AccountMasterListViewController()
    
    let actionBarHeight = CGFloat(56.0)
    let headerHeight    = CGFloat(72.0)
    var tableHeight :CGFloat!
    
    override func accessibilityPerformEscape() -> Bool {
        popController()
        return true
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewController.superNavigationController = self.navigationController
        
        self.title = "Example App"
        
        let toolBarOffset = (self.navigationController?.toolbar)!.frame.height + UIApplication.shared.statusBarFrame.height
        tableHeight = self.view.frame.height - actionBarHeight - headerHeight - toolBarOffset
        
        header = AccountMasterHeaderView()
        
        self.view.addSubview(header)
        
        self.view.constrainChild(header,
                                 xAlignment: .center,
                                 yAlignment: .top,
                                 width: self.view.frame.width,
                                 height: headerHeight,
                                 yOffset: toolBarOffset)
        
        self.view.addSubview(tableViewController.view)
        tableViewController.view.constrainBelow(header,
                                    xAlignment: .left,
                                    width: self.view.frame.width,
                                    height: tableHeight)
        
        self.view.backgroundColor = UIColor.white
        styleNavigationBar()
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func styleNavigationBar() {
        let newBackButton = UIBarButtonItem(image: UIImage.sldsUtilityIcon(.chevronleft,
                                                                           withSize: SLDSSquareIconUtilityMedium).withAlignmentRectInsets(UIEdgeInsetsMake(0, 0, -1, 0)),
                                            style: UIBarButtonItemStyle.done,
                                            target: self,
                                            action: #selector(AccountMasterViewController.popController))
        
        newBackButton.accessibilityTraits = UIAccessibilityTraitButton
        newBackButton.accessibilityLabel = "back button"
        navigationItem.leftBarButtonItem = newBackButton
        self.navigationController?.navigationBar.barTintColor = UIColor.sldsBackgroundColor(.colorBrand)
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        self.navigationController?.navigationBar.backIndicatorImage = UIImage.sldsUtilityIcon(.chevronleft,
                                                                                              withSize: SLDSSquareIconUtilityMedium).withAlignmentRectInsets(UIEdgeInsetsMake(0, 0, -1, 0))
        
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage.sldsUtilityIcon(.chevronleft,
                                                                                                            withSize: SLDSSquareIconUtilityMedium).withAlignmentRectInsets(UIEdgeInsetsMake(0, 0, -1, 0))
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white,
                                                                        NSFontAttributeName: UIFont.sldsFont(.regular, with: .medium)]
        self.navigationItem.hidesBackButton = false
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func popController() {
        NotificationCenter.default.post(name: NSNotification.Name("returnToLibrary"), object: self)
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
}
