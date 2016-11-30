//
//  FontLIstTableViewController.swift
//  slds-sample-app
//
//  Created by Joe Andolina on 11/21/16.
//  Copyright © 2016 John Earle. All rights reserved.
//

import UIKit

class FontListTableViewController: UITableViewController {
    
    var fontTypes = Array<String>();
    var fontSizes = Array<String>();
  
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Fonts"
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "fontCell")
        
        // NOTE: Collecting all the Font Names
        repeat {
            if let fontType = SLDSFontType.init(rawValue: fontTypes.count),
                let fontName = SLDSFont.sldsFontTypeName(fontType) {
                fontTypes.append(fontName.replacingOccurrences(of: "SLDSFontType", with: ""))
            }
        } while SLDSFontType.init(rawValue: fontTypes.count)?.hashValue != 0
        
        // NOTE: Collecting all the Font Sizes
        repeat {
            if let fontSize = SLDSFontSizeType.init(rawValue: fontSizes.count),
                let sizeName = SLDSFont.sldsFontSizeName(fontSize) {
                fontSizes.append(sizeName.replacingOccurrences(of: "SLDSFontSize", with: ""))
            }
        } while SLDSFontSizeType.init(rawValue: fontSizes.count)?.hashValue != 0
    }

    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return fontTypes.count
    }

    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fontSizes.count
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30.0
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func tableView(_ tableView: UITableView, indentationLevelForRowAt indexPath: IndexPath) -> Int {
        return 2
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UITableViewHeaderFooterView.init()
        header.textLabel?.text = fontTypes[section]
        return header
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "fontCell", for: indexPath)
        cell.textLabel?.text = fontSizes[indexPath.row]
        cell.textLabel?.font = UIFont.sldsFont(SLDSFontType.init(rawValue: indexPath.section)!, with:SLDSFontSizeType.init(rawValue:indexPath.row)!)
        return cell
    }

}
