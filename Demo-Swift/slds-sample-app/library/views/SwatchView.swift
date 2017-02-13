// Copyright (c) 2017, salesforce.com, inc. All rights reserved
// Licensed under BSD 3-Clause - see LICENSE.txt or git.io/sfdc-license

import UIKit

class SwatchView: UIView {
    
    var swatch = UIView()
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    var dataProvider : UIColor? {
        get {
            return self.swatch.backgroundColor
        }
        set {
            self.swatch.backgroundColor = newValue
            self.backgroundColor = UIColor(patternImage: UIImage(named: "checkered.png")!)
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
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 6
        self.layer.borderColor = UIColor.sldsBorderColor(.colorBorderInput).cgColor
        self.layer.backgroundColor = UIColor.white.cgColor
        
        self.backgroundColor = UIColor(patternImage: UIImage(named: "checkered.png")!)
        self.clipsToBounds = true
        
        self.addSubview(self.swatch)
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func layoutSubviews() {
        self.swatch.frame = self.bounds.insetBy(dx: 1.0, dy: 1.0)
    }
}
