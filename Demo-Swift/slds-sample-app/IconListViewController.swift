//
//  ViewController.swift
//  slds-sample-app
//
//  Created by John Earle on 11/7/16.
//  Copyright © 2016 John Earle. All rights reserved.
//

import UIKit


class IconListViewController: UITableViewController {
    
    struct IconObject {
        var icon : UIImageView!
    }
    
    var icons = [IconObject]()
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func viewDidLoad() {
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        self.title = "Background Colors"
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> ColorCell {
        
        let color = colors[indexPath.item].color
        let alias = colors[indexPath.item].alias
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ColorCell
        
        //        cell.selectionStyle = .none
        cell.backgroundColor = UIColor.clear
        cell.textLabel?.text = alias?.replacingOccurrences(of: "SLDSColor", with: "")
        cell.textLabel?.font = UIFont.sldsFont(.regular, with: .small)
        cell.updateColor(color!)
        
        return cell
    }
    
    ovver
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = ColorViewController()
        let alias = colors[indexPath.item].alias
        controller.addColor(colors[indexPath.item].color, (alias?.replacingOccurrences(of: "SLDSColorB", with: ".b"))!)
        self.navigationController?.show(controller, sender: self)
    }
}
