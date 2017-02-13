// Copyright (c) 2017, salesforce.com, inc. All rights reserved
// Licensed under BSD 3-Clause - see LICENSE.txt or git.io/sfdc-license

import UIKit

class LibraryCell: UITableViewCell {
    
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if let label = self.textLabel {
            label.frame = CGRect(x: 0, y: 10, width: self.frame.width, height: 30)
        }
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func loadView() {
        self.backgroundColor = UIColor.sldsFill(.brandActive)
        
        self.selectedBackgroundView = UIView()
        self.selectedBackgroundView?.backgroundColor = UIColor.sldsFill(.brandActive)
        
        if let label = self.textLabel {
            label.text = "Library"
            label.textAlignment = .center
            label.textColor = UIColor.sldsTextColor(.colorTextInverse)
            label.font = UIFont.sldsFont(.regular, with: .large)
        }
        
        let image = UIImageView(image: UIImage(named: "tokens"))
        self.addSubview(image)
        self.constrainChild(image, xAlignment: .center, yAlignment: .center, width: 222, height: 175, yOffset: 10)
    }
    
}
