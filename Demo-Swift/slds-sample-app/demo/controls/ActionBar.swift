// Copyright (c) 2017, salesforce.com, inc. All rights reserved
// Licensed under BSD 3-Clause - see LICENSE.txt or git.io/sfdc-license

import UIKit

struct ActionItem {
    var label : String!
    var iconId : SLDSActionIconType!
}

//––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

class ActionBar: ItemBar {
    
    var actionItemsHidden: Bool = false
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    var firstPosition : NSLayoutConstraint? {
        guard let first = self.items.first else
        {
            return nil
        }
        
        for constraint in self.constraints {
            if first.isEqual(constraint.firstItem) &&
                constraint.firstAttribute == .bottom {
                return constraint
            }
        }
        return nil
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func draw(_ rect: CGRect) {
        let aPath = UIBezierPath()
        
        aPath.move(to: CGPoint(x:0, y:0))
        aPath.addLine(to: CGPoint(x:self.frame.width, y:0))
        aPath.close()
        aPath.lineWidth = 1.0
        UIColor.sldsBorderColor(.colorBorderSeparatorAlt2).set()
        aPath.stroke()
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func addActionBarButton(_ actionButton : ActionBarButton) {
        super.addItem(item: actionButton)
        
        if self.items.count == 1 {
            self.firstPosition?.constant = self.actionItemsHidden ? self.frame.height : 0
        }
    }

    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func showActionBarButtons(_ animated : Bool=true, completion: ( (Void) -> (Void) )?=nil ) {
        self.actionItemsHidden = false
        animateActionBarButtons(animated, completion: completion)    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func hideActionBarButtons(_ animated : Bool=true, completion: ( (Void) -> (Void) )?=nil ) {
        self.actionItemsHidden = true
        animateActionBarButtons(animated, completion: completion)
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    private func animateActionBarButtons(_ animated : Bool=true, completion: ( (Void) -> (Void) )?=nil ) {
        let ease = self.actionItemsHidden ? UIViewAnimationOptions.curveEaseIn : UIViewAnimationOptions.curveEaseOut
        
        self.firstPosition?.constant = self.actionItemsHidden ? 56 : 0
        
        guard animated else {
            self.layoutIfNeeded()
            if completion != nil {
                completion!()
            }
            return
        }
        
        UIView.animate(withDuration: 0.3,
                       delay: 0,
                       options: ease, animations: {
            self.layoutIfNeeded()
        }, completion: { (Bool) in
            if completion != nil {
                completion!()
            }
        })
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
}
