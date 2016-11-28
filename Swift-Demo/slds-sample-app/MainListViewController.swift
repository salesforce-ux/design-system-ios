//
//  MainListViewController.swift
//  slds-sample-app
//
//  Created by John Earle on 11/17/16.
//  Copyright © 2016 John Earle. All rights reserved.
//

import UIKit

struct TableData {
    var sectionTitle: String
    var rows: [String]
    var controllers: [UIViewController.Type]
}

class MainListViewController: UITableViewController {
    
    var tableData : [TableData] {
        return [
            TableData(sectionTitle: "Sample App",
                      rows: ["User Records"],
                      controllers: [UserListViewController.self]),
            
            TableData(sectionTitle: "SLDS Reference",
                      rows: ["Background Colors", "Text Colors", "Border Colors", "Fonts"],
                      controllers: [BackgroundColorListViewController.self, TextColorListViewController.self, BorderColorListViewController.self, FontListTableViewController.self])
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
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return tableData.count
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData[section].rows.count
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return tableData[section].sectionTitle
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CategoryCell
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        cell.textLabel?.text = tableData[indexPath.section].rows[indexPath.row]
        return cell
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = tableData[indexPath.section].controllers[indexPath.row]
        self.navigationController?.show(controller.init(), sender: self)
    }
    
}
