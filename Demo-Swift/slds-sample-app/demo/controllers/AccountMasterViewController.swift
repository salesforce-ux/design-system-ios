/*
 Copyright (c) 2016, salesforce.com, inc. All rights reserved.
 Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
 Neither the name of salesforce.com, inc. nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

import UIKit

class AccountMasterViewController: UIViewController {
    
    var header          = UIView()
    var headerIcon      = UIImageView()
    var headerTitle     = UILabel()
    var headerSubText   = UILabel()
    var headerDownArrow = UIImageView()
    
    var tableViewController = AccountMasterListViewController()
    
    let actionBarHeight = CGFloat(64.0)
    let headerHeight    = CGFloat(80.0)
    
    var tableHeight :CGFloat!
    
    
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
        let newBackButton = UIBarButtonItem(image: UIImage.sldsIconUtility(.chevronleft,
                                                                           with: UIColor.white,
                                                                           andSize: SLDSSquareIconUtilityMedium).withAlignmentRectInsets(UIEdgeInsetsMake(0, 0, -1, 0)),
                                            style: UIBarButtonItemStyle.done,
                                            target: self,
                                            action: #selector(AccountMasterViewController.popController))
        
        navigationItem.leftBarButtonItem = newBackButton
        self.navigationController?.navigationBar.barTintColor = UIColor.sldsColorBackground(.brand)
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        self.navigationController?.navigationBar.backIndicatorImage = UIImage.sldsIconUtility(.chevronleft,
                                                                                              with: UIColor.white,
                                                                                              andSize: SLDSSquareIconUtilityMedium).withAlignmentRectInsets(UIEdgeInsetsMake(0, 0, -1, 0))
        
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage.sldsIconUtility(.chevronleft,
                                                                                                            with: UIColor.white,
                                                                                                            andSize: SLDSSquareIconUtilityMedium).withAlignmentRectInsets(UIEdgeInsetsMake(0, 0, -1, 0))
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white,
                                                                        NSFontAttributeName: UIFont.sldsFont(.regular, with: .mediumA)]
        self.navigationItem.hidesBackButton = false
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func popController() {
        NotificationCenter.default.post(name: NSNotification.Name("returnToLibrary"), object: self)
    }

    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
}
