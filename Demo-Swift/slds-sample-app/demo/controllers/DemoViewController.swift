// Copyright (c) 2015-present, salesforce.com, inc. All rights reserved
// Licensed under BSD 3-Clause - see LICENSE.txt or git.io/sfdc-license

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
                button.setImage(UIImage.sldsActionIcon(item.iconId, withSize: 28), for: .normal)
                button.setTitle(item.label, for: .normal)
                self.actionBar.addActionBarButton(button)
            }
            self.actionBar.showActionBarButtons()
        }
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

}
