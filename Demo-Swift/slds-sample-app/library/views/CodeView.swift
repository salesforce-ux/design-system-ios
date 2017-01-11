/*
 Copyright (c) 2016, salesforce.com, inc. All rights reserved.
 Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
 Neither the name of salesforce.com, inc. nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

import UIKit


class CodeView: UIView, ItemBarDelegate {
    
    var tabBar = TabBar()
    var codeExample = UITextView()
    var copyButton = UIButton()
    
    var colors : Array<UIColor> {
        return [ UIColor(red: 97/255, green: 42/255, blue: 171/255, alpha: 1.0),
                 UIColor(red: 42/255, green: 76/255, blue: 80/255, alpha: 1.0),
                 UIColor.black]
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
   
    var showSwift : Bool {
        get {
            return ApplicationModel.sharedInstance.showSwift
        }
        set {
            if newValue != self.showSwift {
                ApplicationModel.sharedInstance.showSwift = newValue
                self.updateExample()
            }
        }
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    var objCParameters : Array<String>? {
        didSet {
            guard let params = self.objCParameters else {
                return
            }
            
            let retVal = NSMutableAttributedString(string: "[", attributes: [NSForegroundColorAttributeName:colors[2]])
            
            retVal.append( NSMutableAttributedString(string: params[0] + " ", attributes: [NSForegroundColorAttributeName:colors[0]] ))
            
            retVal.append( NSMutableAttributedString(string: params[1], attributes: [NSForegroundColorAttributeName:colors[1]]))
            
            retVal.append( NSMutableAttributedString(string: ":", attributes: [NSForegroundColorAttributeName:colors[2]] ))
            
            retVal.append( NSMutableAttributedString(string: params[2], attributes: [NSForegroundColorAttributeName:colors[1]]))
            
            for i in stride(from: 3, to: params.count, by: 2) {
                retVal.append( NSMutableAttributedString(string: "\n" + params[i], attributes: [NSForegroundColorAttributeName:colors[0]]))
                
                retVal.append( NSMutableAttributedString(string: ":", attributes: [NSForegroundColorAttributeName:colors[2]] ))
                
                retVal.append( NSMutableAttributedString(string: params[i+1], attributes: [NSForegroundColorAttributeName:colors[1]]))
            }
            
            retVal.append( NSMutableAttributedString(string: "];", attributes: [NSForegroundColorAttributeName:colors[2]] ))
            
            self.objCString = self.applyCodeFormat(string: retVal)
        }
    }

    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    private var objCString : NSAttributedString? {
        didSet {
            if !self.showSwift {
                self.updateExample()
            }
        }
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    var swiftParameters : Array<String>? {
        didSet {
            guard let params = self.swiftParameters else {
                return
            }
            
            let retVal = NSMutableAttributedString(string: params[0], attributes: [NSForegroundColorAttributeName:colors[0]])
            
            retVal.append( NSMutableAttributedString(string: ".", attributes: [NSForegroundColorAttributeName:colors[2]] ))
            
            retVal.append( NSMutableAttributedString(string: params[1], attributes: [NSForegroundColorAttributeName:colors[1]]))
            
            retVal.append( NSMutableAttributedString(string: "( .", attributes: [NSForegroundColorAttributeName:colors[2]] ))
            
            retVal.append( NSMutableAttributedString(string: params[2], attributes: [NSForegroundColorAttributeName:colors[1]] ))
            
            for i in stride(from: 3, to: params.count, by: 2) {
                retVal.append( NSMutableAttributedString(string: ", " + params[i] + ": .", attributes: [NSForegroundColorAttributeName:colors[2]]))
                
                retVal.append( NSMutableAttributedString(string: params[i+1], attributes: [NSForegroundColorAttributeName:colors[1]] ))
            }
            
            retVal.append( NSMutableAttributedString(string: " )", attributes: [NSForegroundColorAttributeName:colors[2]] ))
            
            self.swiftString = self.applyCodeFormat(string: retVal)
        }
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    private var swiftString : NSAttributedString? {
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
        self.backgroundColor = UIColor.sldsBackgroundColor(.colorBackgroundStencil)
        
        tabBar.delegate = self
        tabBar.addTab(withLabelString: "Swift")
        tabBar.addTab(withLabelString: "Obj-C")
        tabBar.selectedIndex = ApplicationModel.sharedInstance.showSwift ? 0 : 1
        self.addSubview(tabBar)
        
        codeExample.isEditable = false
        codeExample.isSelectable = false
        codeExample.textContainer.lineBreakMode = .byCharWrapping
        codeExample.backgroundColor = self.backgroundColor
        self.addSubview(codeExample)
        
        copyButton.setTitle("Copy", for: .normal)
        copyButton.titleLabel?.font = UIFont.sldsFont(.regular, with: .fontSizeMedium)
        copyButton.setTitleColor(UIColor.sldsTextColor(.colorTextBrand), for: .normal)
        copyButton.addTarget(self, action: #selector(copyCodeSample), for: .touchUpInside)
        self.addSubview(copyButton)
        
        self.constrainChild(self.tabBar,
                            xAlignment: .center,
                            yAlignment: .top,
                            height: 30)
        
        self.codeExample.constrainBelow(self.tabBar,
                                        xAlignment: .center,
                                        height: 70,
                                        yOffset: 20)
        
        self.constrainChild(self.copyButton,
                       xAlignment: .center,
                       yAlignment: .bottom,
                       yOffset: 40)
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func layoutSubviews() {
        self.codeExample.widthConstraint.constant = self.frame.width - 40
        self.tabBar.widthConstraint.constant = self.frame.width
        super.layoutSubviews()
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func updateExample() {
        UIView.animate(withDuration: 0.3, animations: {
            self.codeExample.alpha = 0
        }, completion: { (value: Bool) in
            self.copyButton.setTitle("Copy", for: .normal)
            self.codeExample.attributedText = self.showSwift ? self.swiftString : self.objCString
            UIView.animate(withDuration: 0.4, animations: {
                self.codeExample.alpha = 1.0
            })
        })
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func itemBar(_ itemBar: ItemBar, didSelectItemAt index: NSInteger) {
        self.showSwift = index == 0
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func copyCodeSample() {
        copyButton.setTitle("Copied!", for: .normal)
        UIPasteboard.general.string = self.codeExample.attributedText.string
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    private func applyCodeFormat( string : NSMutableAttributedString ) -> NSAttributedString
    {
        let fullRange = NSRange.init(location: 0, length: string.string.characters.count)
        let style = NSMutableParagraphStyle()
        style.alignment = .center
        string.addAttribute(NSParagraphStyleAttributeName, value: style, range: fullRange)
        string.addAttribute(NSFontAttributeName, value: UIFont.sldsFont(.regular, with: .fontSizeSmall), range: fullRange)
        return string
    }
}
