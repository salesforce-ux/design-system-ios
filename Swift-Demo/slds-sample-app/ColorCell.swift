//
//  AccountsCell.swift
//  slds-sample-app
//
//  Created by John Earle on 11/14/16.
//  Copyright © 2016 John Earle. All rights reserved.
//

import UIKit

class ColorCell: UITableViewCell {
    
    var backgroundExample = UIView()
    var checkeredBackground = UIView()
    var textExample = UILabel()
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.makeLayout()
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func updateColor(_ c: UIColor) {
        var h1:CGFloat = 0.0
        var s1:CGFloat = 0.0
        var b1:CGFloat = 0.0
        var a1:CGFloat = 0.0
        
        c.getHue(&h1, saturation: &s1, brightness: &b1, alpha: &a1)
        
        if a1 < 1 {
            checkeredBackground.backgroundColor = UIColor(patternImage: UIImage(named: "checkered.png")!)
        }
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func makeLayout() {
        backgroundExample.layer.cornerRadius = 10
        checkeredBackground.layer.cornerRadius = 10
        checkeredBackground.layer.shadowColor = UIColor.black.cgColor
        checkeredBackground.layer.shadowOpacity = 0.5
        checkeredBackground.layer.shadowOffset = CGSize.init(width: 0.7, height: 0.7)
        checkeredBackground.layer.shadowRadius = 1
    }
    
}
