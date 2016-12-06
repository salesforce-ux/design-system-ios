/*
 Copyright (c) 2016, salesforce.com, inc. All rights reserved.
 Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
 Neither the name of salesforce.com, inc. nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

import UIKit

class CodeView: UIView {
    
    var tabView = TabView()
    var codeExample = UITextView()
    var copyButton = UIButton()
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
   
    var showSwift : Bool = true {
        didSet {
            self.updateCodeExample()
        }
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    var objCString : String = "" {
        didSet {
            self.updateCodeExample()
        }
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    var swiftString : String = "" {
        didSet {
            self.updateCodeExample()
        }
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override init (frame : CGRect) {
        super.init(frame : frame)
        self.loadView()
    }

    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    convenience init () {
        self.init(frame:CGRect.zero)
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func loadView() {
        self.backgroundColor = UIColor.sldsColorBackground(.backgroundStencil)
        
        tabView.addTab(labelString: "Swift")
        tabView.addTab(labelString: "Obj-C")
        self.addSubview(tabView)
        
        codeExample.isEditable = false
        codeExample.isSelectable = false
        codeExample.textAlignment = .center
        codeExample.font = UIFont.sldsFont(.regular, with: .small)
        codeExample.textColor = UIColor.sldsColorText(.default)
        codeExample.backgroundColor = self.backgroundColor
        self.addSubview(codeExample)
        
        copyButton.setTitle("copy", for: .normal)
        copyButton.titleLabel?.font = UIFont.sldsFont(.regular, with: .medium)
        copyButton.setTitleColor(UIColor.sldsColorText(.brand), for: .normal)
        self.addSubview(copyButton)
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func layoutSubviews() {
        
        for constraint in self.constraints {
            self.removeConstraint(constraint)
        }
        
        self.constrain(self.tabView,
                       inside: self,
                       xAlignment: .center,
                       yAlignment: .top,
                       width: self.frame.width,
                       height: 60)
        
        self.constrain(self.codeExample,
                       verticallyTo: self.tabView,
                       xAlignment: .center,
                       direction: .down,
                       width: self.frame.width - 40,
                       height: 60,
                       yOffset: 10)
        
        self.constrain(self.copyButton,
                       inside: self,
                       xAlignment: .center,
                       yAlignment: .bottom,
                       yOffset: 40)        
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func updateCodeExample() {
        self.codeExample.text = self.showSwift ? self.swiftString : self.objCString
    }

}
