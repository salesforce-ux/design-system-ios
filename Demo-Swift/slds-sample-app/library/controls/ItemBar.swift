// Copyright (c) 2015-present, salesforce.com, inc. All rights reserved
// Licensed under BSD 3-Clause - see LICENSE.txt or git.io/sfdc-license

import UIKit

protocol ItemBarDelegate {
    
    func itemBar(_ itemBar: ItemBar, didSelectItemAt index: NSInteger)
}

class ItemBar: UIControl {
    
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
    
    func addItem(item : UIControl) {
        self.addSubview(item)
        
        if items.count > 0 {
            item.constrainRightOf(items.last!,
                                  yAlignment: .bottom)
            
        } else {
            self.constrainChild(item,
                                xAlignment: .left,
                                yAlignment: .bottom)
        }
        
        self.items.append(item)
        item.addTarget(self, action: #selector(ItemBar.didSelectItemAt(sender:)), for: .touchUpInside)
        self.layoutIfNeeded()
    }
}
