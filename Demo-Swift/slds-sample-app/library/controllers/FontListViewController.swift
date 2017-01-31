/*
 Copyright (c) 2016, salesforce.com, inc. All rights reserved.
 Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
 Neither the name of salesforce.com, inc. nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

import UIKit

enum FontObjectType : String {
    case salesforceSans = "SalesforceSans"
    case lato = "Lato"
}

class FontListViewController: UITableViewController {
    
    var fontTypes = [String]()
    var fontSizes = [String]()
    var customFonts = ["Lato-Thin.ttf", "Lato-Light.ttf", "Lato-Regular.ttf", "Lato-Semibold.ttf", "Lato-Bold.ttf"]
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override var title: String? {
        didSet {
            super.title = self.title
            if let newTitle = self.title {
                self.fontType = newTitle
            }
        }
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    var fontType: String? {
        get {
            return self.title
        }
        set {
            self.fontTypes.removeAll()
            
            if newValue == FontObjectType.salesforceSans.rawValue {
                UIFont.sldsUseDefaultFonts()
                repeat {
                    if let fontType = SLDSFontType.init(rawValue: fontTypes.count),
                        let fontName = UIFont.sldsFontName(fontType) {
                        fontTypes.append(fontName.replacingOccurrences(of: "SLDSFontType", with: ""))
                    }
                } while SLDSFontType.init(rawValue: fontTypes.count)?.hashValue != 0
            }
            else {
                for var fontName in customFonts {
                    UIFont.sldsUse(fontName, fromBundle: "CustomFont", for: SLDSFontType.init(rawValue:fontTypes.count)!)
                    fontName = fontName.replacingOccurrences(of: "Lato-", with: "")
                    fontTypes.append(fontName.replacingOccurrences(of: ".ttf", with: ""))
                }
                UIColor.sldsBorderColor( .colorBorderSuccess )
            }
        }
    }

    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "fontCell")
        
        // NOTE: Collecting all the Font Sizes
        repeat {
            if let fontSize = SLDSFontSizeType.init(rawValue: fontSizes.count),
                let sizeName = UIFont.sldsFontSizeName(fontSize) {
                fontSizes.append(sizeName.replacingOccurrences(of: "SLDSFontSize", with: ""))
            }
        } while SLDSFontSizeType.init(rawValue: fontSizes.count)?.hashValue != 0
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func viewWillDisappear(_ animated: Bool) {
        UIFont.sldsUseDefaultFonts()
        super.viewWillDisappear(animated)
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
        return 36.0
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func tableView(_ tableView: UITableView, indentationLevelForRowAt indexPath: IndexPath) -> Int {
        return 2
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return SectionHeaderView()
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return fontTypes[section]
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "fontCell", for: indexPath)
        cell.textLabel?.text = fontSizes[indexPath.row]
        cell.textLabel?.font = UIFont.sldsFont(SLDSFontType.init(rawValue: indexPath.section)!, with:SLDSFontSizeType.init(rawValue:indexPath.row)!)
        return cell
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller  = FontViewController()
        controller.dataProvider = indexPath
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
