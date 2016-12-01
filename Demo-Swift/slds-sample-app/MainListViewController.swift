/*
 Copyright (c) 2016, salesforce.com, inc. All rights reserved.
 Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
 Neither the name of salesforce.com, inc. nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

import UIKit

struct TableData {
    var sectionTitle: String
    var rows: [(name:String,type:UIViewController.Type)]
}

class MainListViewController: UITableViewController {
    
    var tableData : [TableData] {
        return [
            TableData(sectionTitle: "Sample App",
                      rows: [("User Records",UserListViewController.self)]),
            
            TableData(sectionTitle: "SLDS Colors",
                      rows: [(ColorListType.background.rawValue, ColorListViewController.self),
                             (ColorListType.border.rawValue, ColorListViewController.self),
                             (ColorListType.text.rawValue, ColorListViewController.self)]),
            
            TableData(sectionTitle: "SLDS Fonts",
                      rows: [(FontListType.salesforceSans.rawValue, FontListTableViewController.self),
                             (FontListType.lato.rawValue, FontListTableViewController.self)]),

            TableData(sectionTitle: "SLDS Icons",
                      rows: [(IconListType.action.rawValue, IconListViewController.self),
                             (IconListType.custom.rawValue, IconListViewController.self),
                             (IconListType.utility.rawValue, IconListViewController.self),
                             (IconListType.standard.rawValue, IconListViewController.self)])
        ]
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func viewDidLoad() {
        self.tableView.register(CategoryCell.self, forCellReuseIdentifier: "Cell")
        navigationController?.navigationBar.barTintColor = UIColor.sldsColorBackground(.brand)
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white, NSFontAttributeName: UIFont.sldsFont(.regular, with: .mediumA)]
        
        let backButton = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: self, action: nil)
        backButton.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.white, NSFontAttributeName: UIFont.sldsFont(.regular, with: .mediumA)], for: UIControlState.normal)
        navigationItem.backBarButtonItem = backButton
        
        self.title = "Lightning Design System"
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 36.0
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return tableData.count
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData[section].rows.count
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func tableView(_ tableView: UITableView, indentationLevelForRowAt indexPath: IndexPath) -> Int {
        return 2
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func tableView (_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView {
        return SectionHeaderView()
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return tableData[section].sectionTitle
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        cell.textLabel?.font = UIFont.sldsFont(.regular, with: .medium)
        
        var rowName = tableData[indexPath.section].rows[indexPath.row].name
        
        if tableData[indexPath.section].rows[indexPath.row].type == ColorListViewController.self {
            rowName += " Colors"
        }
        
         cell.textLabel?.text = rowName
        return cell
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controllerClass = tableData[indexPath.section].rows[indexPath.row].type
        let controller = controllerClass.init()
        controller.title = tableData[indexPath.section].rows[indexPath.row].name
        self.navigationController?.show(controller, sender: self)
    }
}
