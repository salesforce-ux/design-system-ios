// Copyright (c) 2017, salesforce.com, inc. All rights reserved
// Licensed under BSD 3-Clause - see LICENSE.txt or git.io/sfdc-license

import UIKit

struct TableData {
    var sectionTitle: String
    var rows: [(name:String,type:UIViewController.Type)]
}

class LibraryListViewController: UITableViewController {
    
    var tableData : [TableData] {
        return [
            TableData(sectionTitle: "Colors",
                      rows: [(ColorObjectType.background.rawValue, ColorListViewController.self),
                             (ColorObjectType.border.rawValue, ColorListViewController.self),
                             (ColorObjectType.fill.rawValue, ColorListViewController.self),
                             (ColorObjectType.text.rawValue, ColorListViewController.self)]),
            
            TableData(sectionTitle: "Fonts",
                      rows: [(FontObjectType.salesforceSans.rawValue, FontListViewController.self),
                             (FontObjectType.lato.rawValue, FontListViewController.self)]),
            
            TableData(sectionTitle: "Icons",
                      rows: [(IconObjectType.action.rawValue, IconListViewController.self),
                             (IconObjectType.custom.rawValue, IconListViewController.self),
                             (IconObjectType.standard.rawValue, IconListViewController.self),
                             (IconObjectType.utility.rawValue, IconListViewController.self)])
        ]
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Library"
        self.view.backgroundColor = UIColor.white
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white,
                                                                   NSFontAttributeName: UIFont.sldsFont(.regular, with: .medium)]
        
        navigationItem.backBarButtonItem?.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.white,
                                                                  NSFontAttributeName: UIFont.sldsFont(.regular, with: .medium)],
                                                                 for: UIControlState.normal)
        
        super.viewWillAppear(animated)
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
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
        if let label = cell.textLabel {
            label.font = UIFont.sldsFont(.regular, with: .medium)
            label.text = tableData[indexPath.section].rows[indexPath.row].name
            label.accessibilityLabel = label.text! + tableData[indexPath.section].sectionTitle
        }
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
