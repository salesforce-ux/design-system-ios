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
    
    var exampleText : String {
        get {
            return self.codeExample.text
        }
        set {
            self.codeExample.text = newValue
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
        codeExample.font = UIFont.sldsFont(.regular, with: .medium)
        codeExample.textColor = UIColor.sldsColorText(.default)
        codeExample.backgroundColor = UIColor.blue
        self.addSubview(codeExample)
        
        copyButton.setTitle("copy", for: .normal)
        copyButton.titleLabel?.font = UIFont.sldsFont(.regular, with: .medium)
        copyButton.setTitleColor(UIColor.sldsColorText(.brand), for: .normal)
        self.addSubview(copyButton)
        
        self.addConstraints(ConstraintsHelper.addConstraints(item: self.codeExample,
                                                             toItem: self,
                                                             xAlignment: "center",
                                                             yAlignment: "top",
                                                             xOffset: 0,
                                                             yOffset: 20))
        
        self.addConstraints(ConstraintsHelper.stackV(item: self.copyButton,
                                                     toItem: self.codeExample,
                                                     center: true,
                                                     invert: false,
                                                     xOffset: 0,
                                                     yOffset: 80))
    }
}
