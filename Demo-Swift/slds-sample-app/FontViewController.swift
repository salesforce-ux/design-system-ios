/*
 Copyright (c) 2016, salesforce.com, inc. All rights reserved.
 Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
 Neither the name of salesforce.com, inc. nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

import UIKit

class FontViewController: UIViewController {
    
    var fontSizeName : String = ""
    var fontTypeName : String = ""
    
    var sampleText = UILabel()
    var fontInfo = UITextView()
    var codeView = CodeView()
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    var indexPath = IndexPath(row: 0, section: 0) {
        didSet {
            fontSizeName = self.enumName( name: SLDSFont.sldsFontSizeName(SLDSFontSizeType(rawValue: self.indexPath.row)!))
            fontTypeName = self.enumName( name: SLDSFont.sldsFontTypeName(SLDSFontType(rawValue: self.indexPath.section)!))
            
            self.sampleText.font = UIFont.sldsFont(SLDSFontType(rawValue: self.indexPath.section)!,
                                                   with: SLDSFontSizeType(rawValue: self.indexPath.row)!)
            
            fontInfo.text = "SLDSFontType" + fontTypeName + "\n SLDSFontSizeType" + fontSizeName
            
            
            self.codeView.objCString = "[UIFont sldsFont:" +
                SLDSFont.sldsFontTypeName(SLDSFontType(rawValue: self.indexPath.section)!) +
                " withSize:" +
                SLDSFont.sldsFontSizeName(SLDSFontSizeType(rawValue: self.indexPath.row)!) +
                " ]"
            
            self.codeView.swiftString = "UIFont.sldsFont( " + fontTypeName + " with: " + fontSizeName + " )"
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
        self.sampleText.textColor = UIColor.sldsColorText(.default)
        self.sampleText.backgroundColor = UIColor.clear
        self.view.addSubview(self.sampleText)
        
        self.fontInfo.textAlignment = .center
        self.fontInfo.isEditable = false
        self.fontInfo.backgroundColor = UIColor.clear
        self.fontInfo.textColor = UIColor.sldsColorText(.default)
        self.fontInfo.font = UIFont.sldsFont(.regular, with: .small)
        self.view.addSubview(self.fontInfo)
        
        self.view.addSubview(codeView)
        
        self.view.addConstraints(ConstraintsHelper.addConstraints(item: self.sampleText,
                                                                  toItem: self.view,
                                                                  xAlignment: .center,
                                                                  yAlignment: .top,
                                                                  xOffset: 0,
                                                                  yOffset: 50))
        
        self.view.addConstraints(ConstraintsHelper.stackV(item: self.fontInfo,
                                                          toItem: self.sampleText,
                                                          width: 200,
                                                          height: 50,
                                                          xAlignment: .center,
                                                          direction: .down,
                                                          xOffset: 0,
                                                          yOffset: 10))
        
       self.view.addConstraints(ConstraintsHelper.addConstraints(item: self.codeView,
                                                                  toItem: self.view,
                                                                  width: self.view.frame.width,
                                                                  height: self.view.frame.height/2,
                                                                  xAlignment: .center,
                                                                  yAlignment: .bottom,
                                                                  xOffset: 0,
                                                                  yOffset: 0))
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

    func enumName(name :String) -> String {
        var newName = name.replacingOccurrences(of: "SLDSFontType", with: "")
        newName = newName.replacingOccurrences(of: "SLDSFontSize", with: "")
        let first = String(newName.characters.prefix(1)).lowercased()
        var second = String(newName.characters.prefix(2).dropFirst())
        
        if second == "X" {
            second = second.lowercased()
        }
        
        return "." + first + second + String(newName.characters.dropFirst(2))
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

}
