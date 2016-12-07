/*
 Copyright (c) 2016, salesforce.com, inc. All rights reserved.
 Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
 Neither the name of salesforce.com, inc. nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

import UIKit

class TabBar: ItemBar {
    
    var underscore = UIView()
    var underscoreX : NSLayoutConstraint?
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override var itemWidth : CGFloat {
        return self.frame.width / CGFloat(self.items.count+1)
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func draw(_ rect: CGRect) {
        let aPath = UIBezierPath()
        
        aPath.move(to: CGPoint(x:0, y:self.frame.height))
        aPath.addLine(to: CGPoint(x:self.frame.width, y:self.frame.height))
        aPath.close()
        aPath.lineWidth = 2.0
        UIColor.sldsColorText(.linkActive).set()
        aPath.stroke()
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func loadView() {
        super.loadView()
        
        self.underscore.backgroundColor = UIColor.sldsColorBorder(.selection)
        self.addSubview(self.underscore)
        
        self.constrainChild(self.underscore,
                            xAlignment: .left,
                            yAlignment: .bottom,
                            width:  10,
                            height: 3)
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.underscore.widthConstraint?.constant = self.itemWidth
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func addTab(labelString :String) {
        let tab = UIButton()
        tab.setTitle(labelString.uppercased(), for: .normal)
        tab.backgroundColor = UIColor.cyan
        tab.titleLabel?.font = UIFont.sldsFont(.regular, with: .small)
        tab.setTitleColor(UIColor.sldsColorText(.default), for: .normal)
        self.addSubview(tab)
        
        if items.count > 0 {
            tab.constrainRightOf(items.last!, yAlignment:.bottom, width:10, height: 30)
        }
        else
        {
            self.constrainChild(tab, xAlignment: .left, yAlignment: .bottom, width:10, height: 30, yOffset: 2.0)
        }
        
        self.items.append(tab)
    }
}