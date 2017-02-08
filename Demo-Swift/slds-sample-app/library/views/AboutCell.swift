// Copyright (c) 2017, salesforce.com, inc. All rights reserved
// Licensed under BSD 3-Clause - see LICENSE.txt or git.io/sfdc-license

import UIKit

class AboutCell: UITableViewCell {
    
    let sldsButton = UIButton()
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.loadView()
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func loadView() {
        self.accessoryType = .none
        self.backgroundColor = UIColor.sldsBackgroundColor(.colorBackgroundSelection)
        
        sldsButton.setTitle("lightningdesignsystem.com", for: .normal)
        sldsButton.addTarget(self, action: #selector(browseToSLDS), for: .touchUpInside)
        sldsButton.titleLabel?.font = UIFont.sldsFont(.regular, with: .small)
        sldsButton.setTitleColor(UIColor.sldsTextColor(.colorTextLink), for: .normal)
        
        self.addSubview(sldsButton)
        self.constrainChild(sldsButton, xAlignment: .center, yAlignment: .bottom, yOffset:20)
        
        if let label = self.textLabel {
            label.text = ""
            label.font = UIFont.sldsFont(.regular, with: .medium)
            self.constrainChild(label, xAlignment: .center, yAlignment: .top,yOffset: 10)
        }
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func layoutSubviews() {
        super.layoutSubviews()
        sldsButton.constrainSize(width: self.contentView.frame.width, height: 20)
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    func browseToSLDS() {
        UIApplication.shared.open(URL(string: "http://lightningdesignsystem.com")!, options: [:], completionHandler: nil)
    }

}
