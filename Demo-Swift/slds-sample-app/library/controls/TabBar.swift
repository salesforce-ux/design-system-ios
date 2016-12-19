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
    
    override var selectedIndex: Int {
        didSet {
            self.moveUnderscore(self.selectedIndex)
        }
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override var itemWidth : CGFloat {
        return self.frame.width / CGFloat(self.items.count)
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
                            height: 3)
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

    override func layoutSubviews() {
        super.layoutSubviews()
        
        if self.underscore.widthConstraint.constant != self.itemWidth {
            self.underscore.widthConstraint.constant = self.itemWidth
            self.moveUnderscore(self.selectedIndex, animated: false)
        }
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func addTab(withLabelString labelString :String) {
        let tab = UIButton()
        tab.setTitle(labelString.uppercased(), for: .normal)
        tab.titleLabel?.font = UIFont.sldsFont(.regular, with: .small)
        tab.setTitleColor(UIColor.sldsColorText(.default), for: .normal)
        super.addItem(item: tab)
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func moveUnderscore(_ index : Int, animated:Bool = true) {
        for c in self.constraints {
            if c.firstItem as! NSObject == underscore,
                c.firstAttribute == .left {
                    c.constant = CGFloat(index) * self.itemWidth
            }
        }
        
        if animated {
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
                self.layoutIfNeeded()
            })
        }
        else
        {
            self.layoutIfNeeded()
        }
    }
}
