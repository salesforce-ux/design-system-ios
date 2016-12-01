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
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    var indexPath = IndexPath(row: 0, section: 0) {
        didSet {
            self.sampleText.font = UIFont.sldsFont(SLDSFontType(rawValue: self.indexPath.section)!,
                                                   with: SLDSFontSizeType(rawValue: self.indexPath.row)!)
            
            fontInfo.text = SLDSFont.sldsFontTypeName(SLDSFontType(rawValue: self.indexPath.section)!) +
                            "\n" + SLDSFont.sldsFontSizeName(SLDSFontSizeType(rawValue: self.indexPath.row)!)
        }
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.edgesForExtendedLayout = []
        
        self.sampleText.text = "AaBbCc"
        self.sampleText.textAlignment = .center
        self.sampleText.contentMode = .center
        self.sampleText.textColor = UIColor.sldsColorText(.default)//UIColor.sldsColorText(.brand)
        self.sampleText.backgroundColor = UIColor.clear
        self.view.addSubview(self.sampleText)
        
        self.fontInfo.textAlignment = .center
        self.fontInfo.isEditable = false
        self.fontInfo.backgroundColor = UIColor.clear
        self.fontInfo.textColor = UIColor.sldsColorText(.default)
        self.fontInfo.font = UIFont.sldsFont(.regular, with: .small)
        self.view.addSubview(self.fontInfo)
   
        self.view.addConstraints(ConstraintsHelper.addConstraints(item: self.sampleText,
                                                                  toItem: self.view,
                                                                  width: self.view.frame.width,
                                                                  height:60,
                                                                  xAlignment: "center",
                                                                  yAlignment: "top",
                                                                  xOffset: 0,
                                                                  yOffset: 20))
        
        self.view.addConstraints(ConstraintsHelper.addConstraints(item: self.fontInfo,
                                                                  toItem: self.sampleText,
                                                                  width: 220,
                                                                  height: 50,
                                                                  xAlignment: "center",
                                                                  yAlignment: "bottom",
                                                                  xOffset: 0,
                                                                  yOffset: 60))
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
}
