/*
 Copyright (c) 2016, salesforce.com, inc. All rights reserved.
 Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
 Neither the name of salesforce.com, inc. nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

import UIKit

struct ActionItem {
    var label : String!
    var iconId : SLDSIconActionType!
}

class ActionBar: ItemBar {
    
    var actionItemsHidden: Bool = false
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func draw(_ rect: CGRect) {
        let aPath = UIBezierPath()
        
        aPath.move(to: CGPoint(x:0, y:0))
        aPath.addLine(to: CGPoint(x:self.frame.width, y:0))
        aPath.close()
        aPath.lineWidth = 1.0
        UIColor.sldsColorBorder(.separatorAlt2).set()
        aPath.stroke()
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
  
    override func updateConstraints() {
        super.updateConstraints()
        for constraint in self.constraints {
            if constraint.firstAttribute == .bottom {
                constraint.constant = self.actionItemsHidden ? 56 : 0
            }
        }
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func addActionItem(withActionItem actionItem : ActionItem) {
        let button = ActionBarButton()
        button.setImage(UIImage.sldsIconAction(actionItem.iconId, withSize: 30), for: .normal)
        button.setTitle(actionItem.label, for: .normal)
        super.addItem(item: button)
        self.setNeedsUpdateConstraints()
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func showActionItems(_ animated : Bool=true, completion: ( (Void) -> (Void) )?=nil ) {
        self.actionItemsHidden = false
        animateActionItems(animated, completion: completion)    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func hideActionItems(_ animated : Bool=true, completion: ( (Void) -> (Void) )?=nil ) {
        self.actionItemsHidden = true
        animateActionItems(animated, completion: completion)
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    private func animateActionItems(_ animated : Bool=true, completion: ( (Void) -> (Void) )?=nil ) {
        
        let ease = self.actionItemsHidden ? UIViewAnimationOptions.curveEaseIn : UIViewAnimationOptions.curveEaseOut
        
        for c in self.constraints {
            if c.firstAttribute == .bottom {
                c.constant = self.actionItemsHidden ? 56 : 0
            }
        }
        
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
    
}