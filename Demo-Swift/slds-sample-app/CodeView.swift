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
    
    var itemBar = ItemBar()
    
    var codeExample = UITextView()
    var copyButton = UIButton()
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
   
    var showSwift : Bool = true {
        didSet {
            if oldValue != self.showSwift {
                self.updateExample()
            }
        }
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    var objCString : String = "" {
        didSet {
            if !self.showSwift {
                self.updateExample()
            }
        }
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    var swiftString : String = "" {
        didSet {
            if self.showSwift {
                self.updateExample()
            }
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
        
        var label = UILabel()
        label.text = "Swift"
        itemBar.addItem(item: label)
        
        label = UILabel()
        label.text = "Obj-C"
        itemBar.addItem(item: label)
        self.addSubview(itemBar)
        
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
        
        self.constrainChild(self.itemBar,
                            xAlignment: .center,
                            yAlignment: .top,
                            width: 10,
                            height: 60)
        
        self.codeExample.constrainBelow(self.itemBar,
                                        xAlignment: .center,
                                        width: 10,
                                        height: 60,
                                        yOffset: 10)
        
        self.constrainChild(self.copyButton,
                       xAlignment: .center,
                       yAlignment: .bottom,
                       yOffset: 40)
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.codeExample.widthConstraint?.constant = self.frame.width - 40
        self.itemBar.widthConstraint?.constant = self.frame.width
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func updateExample() {
        
        self.codeExample.text = self.showSwift ? self.swiftString : self.objCString
    }
    
}
