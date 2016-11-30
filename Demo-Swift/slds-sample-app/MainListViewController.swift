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
    var controllers: [UIViewController]
}

class MainListViewController: UITableViewController {
    
    let backgroundColorListViewController = ColorListViewController()
    let textColorListViewController = ColorListViewController()
    let borderColorListViewController = ColorListViewController()
    
    
    var tableData : [TableData] {
        return [
            TableData(sectionTitle: "Sample App",
                      rows: ["User Records"],
                      controllers: [UserListViewController()]),
            
            TableData(sectionTitle: "SLDS Reference",
                      rows: ["Background Colors", "Text Colors", "Border Colors", "Fonts"],
                      controllers: [ backgroundColorListViewController, textColorListViewController, borderColorListViewController, FontListTableViewController()])
        ]
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func viewDidLoad() {
        
        backgroundColorListViewController.addContent("Background Colors")
        textColorListViewController.addContent("Text Colors")
        borderColorListViewController.addContent("Border Colors")
        
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
        return 36
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return tableData.count
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData[section].rows.count
    }
    
    override func tableView (_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView {
        let view = SectionHeaderView()
        view.setText(tableData[section].sectionTitle)
        return view
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return tableData[section].sectionTitle
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        cell.textLabel?.text = tableData[indexPath.section].rows[indexPath.row]
        cell.textLabel?.font = UIFont.sldsFont(.regular, with: .medium)
        return cell
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = tableData[indexPath.section].controllers[indexPath.row]
        
        self.navigationController?.show(controller, sender: self)
    }
    
}
