// Copyright (c) 2015-present, salesforce.com, inc. All rights reserved
// Licensed under BSD 3-Clause - see LICENSE.txt or git.io/sfdc-license

import UIKit

class FontViewController: UIViewController {
    
    var sampleText = UILabel()
    var fontInfo = UITextView()
    var codeView = CodeView()
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    var dataProvider = IndexPath(row: 0, section: 0) {
        didSet {
            let sizeIndex = SLDSFontSizeType(rawValue: self.dataProvider.row)!
            var fontSizeName = NSString.sldsFontSizeName(sizeIndex.rawValue)!
            
            let typeIndex = SLDSFontType(rawValue: self.dataProvider.section)!
            var fontTypeName = NSString.sldsFontName(typeIndex.rawValue)!
            self.sampleText.font = UIFont.sldsFont(SLDSFontType(rawValue: self.dataProvider.section)!,
                                                   with: SLDSFontSizeType(rawValue: self.dataProvider.row)!)
            
            UIFont.sldsUseDefaultFonts()
            fontInfo.text = "\(fontTypeName)\n \(fontSizeName)"
            self.codeView.objCParameters = ["UIFont","sldsFont", fontTypeName,"withSize",fontSizeName]
            
            fontSizeName = fontSizeName.trimPrefix("SLDSFontSize")
            fontTypeName = fontTypeName.trimPrefix("SLDSFontType")
            self.codeView.swiftParameters = ["UIFont","sldsFont", fontTypeName,"with",fontSizeName]
        }
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.edgesForExtendedLayout = []
        self.view.backgroundColor = UIColor.white
        
        self.sampleText.text = "AaBbCc"
        self.sampleText.textAlignment = .center
        self.sampleText.contentMode = .center
        self.sampleText.textColor = UIColor.sldsTextColor(.colorTextDefault)
        self.sampleText.backgroundColor = UIColor.clear
        self.view.addSubview(self.sampleText)
        
        self.fontInfo.textAlignment = .center
        self.fontInfo.isEditable = false
        self.fontInfo.backgroundColor = UIColor.clear
        self.fontInfo.textColor = UIColor.sldsTextColor(.colorTextDefault)
        self.fontInfo.font = UIFont.sldsFont(.regular, with: .small)
        self.view.addSubview(self.fontInfo)
        
        self.view.addSubview(codeView)
        
        self.view.constrainChild(self.sampleText,
                                 xAlignment: .center,
                                 yAlignment: .top,
                                 yOffset: 70)
        
        self.fontInfo.constrainBelow(self.sampleText,
                                     xAlignment: .center,
                                     width: 200,
                                     height: 150,
                                     yOffset: 10)
        
       self.view.constrainChild(self.codeView,
                                xAlignment: .center,
                                yAlignment: .bottom,
                                width: self.view.frame.width,
                                height: self.view.frame.height/3)
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

}
