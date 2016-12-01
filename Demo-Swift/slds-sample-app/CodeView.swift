//
//  CodeExampleView.swift
//  slds-sample-app
//
//  Created by Joe Andolina on 12/1/16.
//  Copyright © 2016 John Earle. All rights reserved.
//

import UIKit

class CodeView: UIView {
    
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
        
        self.addConstraints(ConstraintsHelper.addConstraints(item: self.codeExample,
                                                             toItem: self,
                                                             width: 300,
                                                             height: 150,
                                                             xAlignment: .center,
                                                             yAlignment: .top,
                                                             xOffset: 0,
                                                             yOffset: 20))
        
        self.addConstraints(ConstraintsHelper.addConstraints(item: self.copyButton,
                                                             toItem: self,
                                                             xAlignment: .center,
                                                             yAlignment: .bottom,
                                                             xOffset: 0,
                                                             yOffset: 40))
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func updateCodeExample() {
        self.codeExample.text = self.showSwift ? self.swiftString : self.objCString
    }

}
