/*
 Copyright (c) 2016, salesforce.com, inc. All rights reserved.
 Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
 Neither the name of salesforce.com, inc. nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

import UIKit

class DemoViewController: UIViewController, ItemBarDelegate, UINavigationControllerDelegate {
    
    var demoNavigationController : UINavigationController?

    var actionItems = Array<ActionItem>()
    var actionBar = ActionBar()
    var actionBarHeight = CGFloat(56.0)
    
    var contentViewController = AccountMasterViewController()
    
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func handleReturnToLibrary() {
        _ = self.navigationController?.popViewController(animated: true)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(DemoViewController.handleReturnToLibrary),
                                               name: NSNotification.Name("returnToLibrary"),
                                               object: nil)
        
        demoNavigationController = UINavigationController(rootViewController: contentViewController)
        
        
        if let nav = demoNavigationController?.view {
            self.view.addSubview(nav)
        }
        
        actionBar.delegate = self
        demoNavigationController?.delegate = self
        
        self.view.addSubview(actionBar)
        self.view.constrainChild(actionBar,
                                 xAlignment: .center,
                                 yAlignment: .bottom,
                                 width: self.view.frame.width,
                                 height: actionBarHeight)
        
        self.view.backgroundColor = UIColor.white
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        super.viewWillAppear(animated)
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK - ItemBar delegate
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func itemBar(_ itemBar: ItemBar, didSelectItemAt index: NSInteger) {
        if itemBar == actionBar {
            // do something with the selection at index
        }
    }
   
    // MARK - UINavigationBar delegate
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        
        if viewController is AccountDetailViewController {
            
            actionItems = [
                ActionItem(label: "Call",   iconId: .call),
                ActionItem(label: "Task",   iconId: .newTask),
                ActionItem(label: "Event",  iconId: .newEvent),
                ActionItem(label: "Post",   iconId: .sharePost),
                ActionItem(label: "More",   iconId: .more)
            ]
            
        } else {
            
            actionItems = [
                ActionItem(label: "Filter", iconId: .filter),
                ActionItem(label: "Sort",   iconId: .sort),
                ActionItem(label: "New",    iconId: .new)
            ]
        }
        
        self.actionBar.hideActionBarButtons() {
            self.actionBar.removeItems()
        
            for item in self.actionItems {
                
                let button = ActionBarButton()
                button.setImage(UIImage.sldsIconAction(item.iconId, withSize: 28), for: .normal)
                button.setTitle(item.label, for: .normal)
                self.actionBar.addActionBarButton(button)
            }
            self.actionBar.showActionBarButtons()
        }
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

}
