//
//  ViewController.swift
//  slds-sample-app
//
//  Created by John Earle on 11/7/16.
//  Copyright © 2016 John Earle. All rights reserved.
//

import UIKit


class BackgroundColorListViewController: ColorListViewController {
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func viewDidLoad() {
        self.tableView.register(BackgroundColorCell.self, forCellReuseIdentifier: "Cell")
        
        colors = addSection(sectionName: "Background Colors")
        self.title = "Background Colors"
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> ColorCell {
        
        let color = colors[indexPath.item].color
        let alias = colors[indexPath.item].alias
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! BackgroundColorCell
        
        cell.backgroundColor = UIColor.clear
        cell.textLabel?.text = alias?.replacingOccurrences(of: "SLDSColor", with: "")
        cell.textLabel?.font = UIFont.sldsFont(.regular, with: .small)
        cell.updateColor(color!)
        
        return cell
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = BackgroundColorViewController()
        controller.addColor(colors[indexPath.item].color)
        self.navigationController?.show(controller, sender: self)
    }
}
