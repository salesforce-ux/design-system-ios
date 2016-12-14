/*
 Copyright (c) 2016, salesforce.com, inc. All rights reserved.
 Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
 Neither the name of salesforce.com, inc. nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

import UIKit

protocol ItemBarDelegate {
    
    func itemBar(_ itemBar: ItemBar, didSelectItemAt index: NSInteger)
    
}

class ItemBar: UIView {
    
    var items = Array<UIControl>()
    var delegate : ItemBarDelegate?
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    var selectedIndex : Int = 0 {
        didSet {
            if let d = self.delegate {
                d.itemBar(self, didSelectItemAt: selectedIndex)
            }
        }
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    var itemWidth : CGFloat {
        return self.frame.width / CGFloat(self.items.count)
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
        self.backgroundColor = UIColor.white
    }

    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        for item in self.items {
            item.heightConstraint.constant = self.frame.height
            item.widthConstraint.constant = self.itemWidth
        }
    }

    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func didSelectItemAt(sender: UIControl) {
        if let index = items.index(of: sender) {
            self.selectedIndex = index
        }
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func removeItems() {
        for item in self.items {
            item.removeFromSuperview()
        }
        self.items.removeAll()
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func addItem(item : UIControl, isVisible: Bool?=nil) {
        self.addSubview(item)

        var initialOffset = CGFloat(0)
        
        if let v = isVisible {
            if !v {
                initialOffset = -item.frame.height
            }
        }
        
        if items.count > 0 {
            item.constrainRightOf(items.last!,
                                  yAlignment:.bottom,
                                  yOffset: 0)
            
        } else {
            self.constrainChild(item,
                                xAlignment: .left,
                                yAlignment: .bottom,
                                yOffset: initialOffset)
        }
        
        item.addTarget(self, action: #selector(ItemBar.didSelectItemAt(sender:)), for: .touchUpInside)
        self.items.append(item)
    }
}
