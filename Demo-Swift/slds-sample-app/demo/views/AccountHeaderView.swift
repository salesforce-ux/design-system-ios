// Copyright (c) 2017, salesforce.com, inc. All rights reserved
// Licensed under BSD 3-Clause - see LICENSE.txt or git.io/sfdc-license

import UIKit

class AccountHeaderView: UIView {
    
    var headerIcon = UIImageView()
    var headerTitle = UILabel()
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func draw(_ rect: CGRect) {
        let aPath = UIBezierPath()
        
        aPath.move(to: CGPoint(x:0, y:self.frame.height))
        aPath.addLine(to: CGPoint(x:self.frame.width, y:self.frame.height))
        aPath.close()
        aPath.lineWidth = 1.0
        UIColor.sldsBorderColor(.colorBorderSeparatorAlt2).set()
        aPath.stroke()
    }
    
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override init (frame : CGRect) {
        super.init(frame : frame)
        self.makeLayout()
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
    
    func makeLayout() {
        self.backgroundColor = UIColor.sldsBackgroundColor(.colorBackground)
        
        
        headerIcon = UIImageView(image: UIImage.sldsStandardIcon(.account,
                                                                 withSize: SLDSSquareIconMedium))
        self.addSubview(headerIcon)
        
        self.constrainChild(headerIcon,
                            xAlignment: .left,
                            yAlignment: .top,
                            xOffset: 10,
                            yOffset: 10)
        
        headerTitle = UILabel()
        headerTitle.font = UIFont.sldsFont(.regular, with: .large)
        
        headerTitle.textColor = UIColor.sldsTextColor(.colorTextDefault)
        
        self.addSubview(headerTitle)
        headerTitle.constrainRightOf(headerIcon,
                                     yAlignment: .top,
                                     xOffset: 15)
    }
}
