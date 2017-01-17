/*
 Copyright (c) 2016, salesforce.com, inc. All rights reserved.
 Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
 Neither the name of salesforce.com, inc. nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

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
        headerTitle.font = UIFont.sldsFont(.regular, with: .fontSizeLarge)
        
        headerTitle.textColor = UIColor.sldsTextColor(.colorTextDefault)
        
        self.addSubview(headerTitle)
        headerTitle.constrainRightOf(headerIcon,
                                     yAlignment: .top,
                                     xOffset: 15)
    }
}
