//
//  ViewController.swift
//  slds-sample-app
//
//  Created by John Earle on 11/7/16.
//  Copyright © 2016 John Earle. All rights reserved.
//

import UIKit

class NavButton: UIButton {
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func layoutSubviews() {
        super.layoutSubviews()
        var frame = self.imageView?.frame;
        frame = CGRect(x:((self.bounds.size.width - (frame?.size.width)!) / 2), y: 0.0, width: (frame?.size.width)!, height: (frame?.size.height)!);
        self.imageView?.frame = frame!;
        
        frame = self.titleLabel?.frame;
        frame = CGRect(x: ((self.bounds.size.width - (frame?.size.width)!) / 2), y: self.bounds.size.height - (frame?.size.height)!, width: (frame?.size.width)!, height: (frame?.size.height)!);
        self.titleLabel?.frame = frame!;
        
        // styling
        self.titleLabel?.font = UIFont.sldsFont(.regular, with: .xSmall)
        self.titleLabel?.textColor = UIColor.sldsColorText(SLDSColorTextType.actionLabel)
    }
}

