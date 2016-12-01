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
    var color = UIColor.white
    
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
        checkeredBackground.backgroundColor = UIColor(patternImage: UIImage(named: "checkered.png")!)
        color = c
        backgroundExample.backgroundColor = color
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        backgroundExample.backgroundColor = color
        checkeredBackground.backgroundColor = UIColor(patternImage: UIImage(named: "checkered.png")!)
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        backgroundExample.backgroundColor = color
        checkeredBackground.backgroundColor = UIColor(patternImage: UIImage(named: "checkered.png")!)
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func makeLayout() {
        
        backgroundExample.layer.cornerRadius = 6
        checkeredBackground.layer.cornerRadius = 6
        checkeredBackground.layer.shadowColor = UIColor.black.cgColor
        checkeredBackground.layer.shadowOpacity = 0.5
        checkeredBackground.layer.shadowOffset = CGSize.init(width: 0.7, height: 0.7)
        checkeredBackground.layer.shadowRadius = 1
        
        self.contentView.addSubview(checkeredBackground)
        checkeredBackground.addSubview(backgroundExample)
        self.contentView.addConstraints(ConstraintsHelper.addConstraints(item: checkeredBackground, toItem: self.contentView, width: 80, height:80, xAlignment: .right, yAlignment: .center, xOffset: -10, yOffset: 0))
        checkeredBackground.addConstraints(ConstraintsHelper.addConstraints(item: backgroundExample, toItem: checkeredBackground, width: 80, height:80, xAlignment: .right, yAlignment: .center, xOffset: 0, yOffset: 0))
        
    }
    
}
