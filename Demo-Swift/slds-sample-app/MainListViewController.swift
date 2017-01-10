/*
 Copyright (c) 2016, salesforce.com, inc. All rights reserved.
 Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
 Neither the name of salesforce.com, inc. nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

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
        
        self.tableView.separatorStyle = .none
        self.navigationController?.navigationBar.barTintColor = UIColor.sldsBackgroundColor(.colorBackgroundButtonBrandActive)
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        self.navigationController?.navigationBar.backIndicatorImage = UIImage.sldsIconUtility(.chevronleft,
                                                                                              with: UIColor.white,
                                                                                              andSize: SLDSSquareIconUtilityMedium).withAlignmentRectInsets(UIEdgeInsetsMake(0, 0, -1, 0))

        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage.sldsIconUtility(.chevronleft,
                                                                                                            with: UIColor.white,
                                                                                                            andSize: SLDSSquareIconUtilityMedium).withAlignmentRectInsets(UIEdgeInsetsMake(0, 0, -1, 0))
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white,
                                                                   NSFontAttributeName: UIFont.sldsFont(.regular, with: .mediumA)]
        
        self.title = "Lightning Design System"
        self.tableView.alwaysBounceVertical = false
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let rowHeight = (self.view.frame.height - tableView.contentInset.top) / CGFloat(tableData.count)
        if indexPath.row < tableData.count - 1 {
            return rowHeight + 60
        }
        return rowHeight - 120
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
