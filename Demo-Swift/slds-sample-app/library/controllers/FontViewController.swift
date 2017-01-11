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
    
    var sampleText = UILabel()
    var fontInfo = UITextView()
    var codeView = CodeView()
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    var dataProvider = IndexPath(row: 0, section: 0) {
        didSet {
            var fontSizeName = SLDSFont.sldsFontSizeName(SLDSFontSizeType(rawValue: self.dataProvider.row)!)!
            var fontTypeName = SLDSFont.sldsFontTypeName(SLDSFontType(rawValue: self.dataProvider.section)!)!
            
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
        self.fontInfo.font = UIFont.sldsFont(.regular, with: .fontSizeSmall)
        self.view.addSubview(self.fontInfo)
        
        self.view.addSubview(codeView)
        
        self.view.constrainChild(self.sampleText,
                                 xAlignment: .center,
                                 yAlignment: .top,
                                 yOffset: 70)
        
        self.fontInfo.constrainBelow(self.sampleText,
                                     xAlignment: .center,
                                     width: 200,
                                     height: 50,
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
