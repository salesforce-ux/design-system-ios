//
//  ViewController.swift
//  slds-sample-app
//
//  Created by John Earle on 11/7/16.
//  Copyright © 2016 John Earle. All rights reserved.
//

import UIKit


class ColorListViewController: UITableViewController {
    
    struct ColorObject {
        var color : UIColor!
        var alias : String!
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    var colors : [ColorObject] = [ColorObject](){
        didSet {
            colors.sort { (c1, c2) -> Bool in
                var h1:CGFloat = 0.0
                var s1:CGFloat = 0.0
                var b1:CGFloat = 0.0
                var a1:CGFloat = 0.0
                
                var h2:CGFloat = 0.0
                var s2:CGFloat = 0.0
                var b2:CGFloat = 0.0
                var a2:CGFloat = 0.0
                
                c1.color.getHue(&h1, saturation: &s1, brightness: &b1, alpha: &a1)
                c2.color.getHue(&h2, saturation: &s2, brightness: &b2, alpha: &a2)
                
                if h1 == h2 {
                    if s1 == s2 {
                        if b1 == b2 {
                            return a2 < a1
                        } else {
                            return b1 < b2
                        }
                    } else {
                        return s1 < s2
                    }
                } else {
                    return h1 < h2
                }
            }
        }
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override var title: String? {
        didSet {
            super.title = self.title
            if let newTitle = self.title {
                self.addContent(newTitle)
            }
        }
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func viewDidLoad() {
        self.tableView.register(ColorCell.self, forCellReuseIdentifier: "Cell")
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func addContent(_ colorType: String) {
        
        var c = Array<ColorObject>()
        var max = 1
        var color = UIColor.white
        var alias = ""
        
        while max != 0 {
            switch colorType {
                case "Background Colors":
                    if (SLDSColorBackgroundType.init(rawValue: max)?.hashValue)! == 0 {
                        max = -1
                        break
                    }
                    color = UIColor.sldsColorBackground(SLDSColorBackgroundType.init(rawValue: max)!)
                    alias = NSString.sldsColorBackgroundName(SLDSColorBackgroundType.init(rawValue: max)!) as String
                case "Text Colors":
                    if (SLDSColorTextType.init(rawValue: max)?.hashValue)! == 0 {
                        max = -1
                        break
                    }
                    color = UIColor.sldsColorText(SLDSColorTextType.init(rawValue: max)!)
                    alias = NSString.sldsColorTextName(SLDSColorTextType.init(rawValue: max)!) as String
                case "Border Colors":
                    max += 1
                    if (SLDSColorBorderType.init(rawValue: max)?.hashValue)! == 0 {
                        max = -1
                        break
                    }
                    color = UIColor.sldsColorBorder(SLDSColorBorderType.init(rawValue: max)!)
                    alias = NSString.sldsColorBorderName(SLDSColorBorderType.init(rawValue: max)!) as String
                default:
                    max = -1
                    break
            }
            
            c.append(ColorObject(color: color, alias: alias))
            max += 1
        }
        
        if c.count > 0 {
            self.colors = c
        }
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
