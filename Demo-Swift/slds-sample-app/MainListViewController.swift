// Copyright (c) 2015-present, salesforce.com, inc. All rights reserved
// Licensed under BSD 3-Clause - see LICENSE.txt or git.io/sfdc-license

import UIKit

class MainListViewController: UITableViewController {
    
    var footerHeight : CGFloat = 200.0
    
    var tableData : [(name:String, cell:UITableViewCell.Type, controller:UIViewController.Type)] {
        return [("DemoCell", DemoCell.self, DemoViewController.self),
                ("LibraryCell", LibraryCell.self, LibraryListViewController.self),
                ("AboutCell", AboutCell.self, UIViewController.self)]
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func viewDidLoad() {
        for item in self.tableData {
            self.tableView.register(item.cell, forCellReuseIdentifier: item.name)
        }
        
        self.view.backgroundColor = UIColor.sldsBackgroundColor(.colorBackgroundRowSelected)
        
        self.tableView.separatorStyle = .none
        
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.tintColor = UIColor.sldsTextColor(.colorTextButtonBrand)
        self.navigationController?.navigationBar.barTintColor = UIColor.sldsFill(.brandActive)
        
        self.navigationController?.navigationBar.backIndicatorImage = UIImage.sldsUtilityIcon(.chevronleft, withSize:SLDSSquareIconUtilityMedium)
        
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage.sldsUtilityIcon(.chevronleft,
                                                                                                            withSize: SLDSSquareIconUtilityMedium).withAlignmentRectInsets(UIEdgeInsetsMake(0, 0, -1, 0))
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white,
                                                                        NSFontAttributeName: UIFont.sldsFont(.regular, with: .medium)]
        
        self.title = "Lightning Design System"
        self.tableView.alwaysBounceVertical = false
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let rowHeight = (self.view.frame.height - tableView.contentInset.top) / CGFloat(tableData.count)
        if indexPath.row < tableData.count - 1 {
            return rowHeight + 70
        }
        return rowHeight - 140
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableData[indexPath.row].name)
        return cell!
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if indexPath.row == tableData.count - 1 {
            return nil
        }
        return indexPath
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controllerClass = tableData[indexPath.row].controller
        let controller = controllerClass.init()
        self.navigationController?.show(controller, sender: self)
    }

}
