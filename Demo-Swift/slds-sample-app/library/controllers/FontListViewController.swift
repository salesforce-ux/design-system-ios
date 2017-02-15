// Copyright (c) 2015-present, salesforce.com, inc. All rights reserved
// Licensed under BSD 3-Clause - see LICENSE.txt or git.io/sfdc-license

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
                    if let _ = SLDSFontType.init(rawValue: fontTypes.count),
                        let fontName = NSString.sldsFontName(fontTypes.count) {
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
            if let _ = SLDSFontSizeType.init(rawValue: fontSizes.count),
                let sizeName = NSString.sldsFontSizeName(fontSizes.count) {
                fontSizes.append(sizeName.replacingOccurrences(of: "SLDSFontSize", with: ""))
            }
        } while SLDSFontSizeType.init(rawValue: fontSizes.count)?.hashValue != 0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIFont.sldsUseDefaultFonts()
        self.fontType = self.title
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
