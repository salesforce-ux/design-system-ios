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
    
   var tableData : [(name:String,type:UIViewController.Type)] {
        return [("Salesforce1", DemoViewController.self),
                ("Library", LibraryListViewController.self),
                ("About", AboutViewController.self)]
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func viewDidLoad() {
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
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
        
        self.title = "Lightning Design System"
        //self.tableView.rowHeight = 44.0
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
    
//    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        footerHeight = self.view.frame.height - (self.tableView.rowHeight * CGFloat(tableData.count))
//        return footerHeight
//    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let button = UIButton()
        button.setTitle("lightningdesignsystem.com", for: .normal)
        button.addTarget(self, action: #selector(browseToSLDS), for: .touchUpInside)
        button.titleLabel?.font = UIFont.sldsFont(.regular, with: .small)
        button.setTitleColor(UIColor.sldsColorText(.link), for: .normal)

        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: footerHeight))
        footerView.addSubview(button)
        footerView.constrainChild(button, xAlignment: .center, yAlignment: .bottom, yOffset: 15)
        return footerView
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        cell.textLabel?.font = UIFont.sldsFont(.regular, with: .medium)
        cell.textLabel?.text = tableData[indexPath.row].name
        return cell
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controllerClass = tableData[indexPath.row].type
        let controller = controllerClass.init()
        controller.title = tableData[indexPath.row].name
        self.navigationController?.show(controller, sender: self)
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    func browseToSLDS() {
        UIApplication.shared.open(URL(string: "http://lightningdesignsystem.com")!, options: [:], completionHandler: nil)
    }
    
}
