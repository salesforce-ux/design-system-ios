//
//  SectionHeaderView.swift
//  slds-sample-app
//
//  Created by John Earle on 11/21/16.
//  Copyright © 2016 John Earle. All rights reserved.
//

import UIKit

class SectionHeaderView: UIView {

    let label = UILabel(frame: CGRect(x: 15, y: 0, width: 500, height: 36))
    
    // MARK: Component initialization
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override init (frame : CGRect) {
        super.init(frame : frame)
        self.makeLayout()
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    convenience init () {
        self.init(frame:CGRect.zero)
        self.makeLayout()
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.makeLayout()
    }

    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func setText(text:String) {
        label.text = text
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

    func makeLayout() {
        label.font = UIFont.sldsFont(.regular, with: .small)
        label.textColor = UIColor.white
        self.backgroundColor = UIColor.sldsColorBackground(.backgroundAltInverse)
        self.addSubview(label)
    }
    
}

