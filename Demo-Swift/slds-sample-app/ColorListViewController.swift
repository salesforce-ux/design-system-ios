/*
 Copyright (c) 2016, salesforce.com, inc. All rights reserved.
 Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
 Neither the name of salesforce.com, inc. nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

import UIKit

//––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

enum ColorListType : String {
    case background = "Background"
    case border = "Border"
    case text = "Text"
}

struct ColorObject {
    var color : UIColor!
    var alias : String!
    var method : String!
}

//––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

class ColorListViewController: UITableViewController {
    
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
        self.tableView.register(AccountCell.self, forCellReuseIdentifier: "Cell2")
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> ColorCell {
        
        let alias = colors[indexPath.item].alias
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ColorCell
        
        cell.backgroundColor = UIColor.clear
        cell.textLabel?.text = alias?.replacingOccurrences(of: "SLDSColor", with: "")
        cell.textLabel?.font = UIFont.sldsFont(.regular, with: .small)
        cell.dataProvider = colors[indexPath.item].color
        
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
        controller.dataProvider = self.colors[indexPath.row]
        self.navigationController?.show(controller, sender: self)
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func addContent(_ colorType: String) {
        
        var colorList = Array<ColorObject>()
        var indexPath : IndexPath
        
        switch colorType {
        case ColorListType.background.rawValue : indexPath = IndexPath(row: 0, section: 0)
        case ColorListType.border.rawValue : indexPath = IndexPath(row: 0, section: 1)
        case ColorListType.text.rawValue : indexPath = IndexPath(row: 0, section: 2)
        default : return
        }
        
        while let color = self.getColorAt(indexPath) {
            colorList.append(color)
            indexPath.row = colorList.count
        }
        
        self.colors = colorList
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func getColorAt(_ indexPath: IndexPath) -> ColorObject? {
        
        var retVal : ColorObject?
        
        switch indexPath.section {
            case 0 :
                if indexPath.row > 0 && (SLDSColorBackgroundType.init(rawValue: indexPath.row)?.hashValue == 0) {
                    break
                }
                
                if let value = SLDSColorBackgroundType.init(rawValue: indexPath.row) {
                    retVal = ColorObject(color: UIColor.sldsColorBackground(value),
                                         alias: NSString.sldsColorBackgroundName(value) as String,
                                         method: "sldsColorBackground")
                }
            
            case 1 :
                if indexPath.row > 0 && (SLDSColorBorderType.init(rawValue: indexPath.row+1)?.hashValue == 0) {
                    break
                }
                if let value = SLDSColorBorderType.init(rawValue:  indexPath.row) {
                    retVal = ColorObject(color: UIColor.sldsColorBorder(value),
                                         alias: NSString.sldsColorBorderName(value) as String,
                                         method: "sldsColorBorder")
                }
            
            case 2 :
                if indexPath.row > 0 && (SLDSColorTextType.init(rawValue: indexPath.row)?.hashValue == 0) {
                    break
                }
                
                if let value = SLDSColorTextType.init(rawValue:  indexPath.row) {
                    retVal = ColorObject(color: UIColor.sldsColorText(value),
                                         alias: NSString.sldsColorTextName(value) as String,
                                         method: "sldsColorText")
                }
            
            default : break
        }
        return retVal
    }
}
