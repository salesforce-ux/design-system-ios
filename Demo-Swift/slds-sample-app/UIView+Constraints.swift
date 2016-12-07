/*
 Copyright (c) 2016, salesforce.com, inc. All rights reserved.
 Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
 Neither the name of salesforce.com, inc. nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

import Foundation

extension UIView {
    
    enum XAlignmentType {
        case left
        case center
        case right
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

    enum YAlignmentType {
        case top
        case center
        case bottom
    }

    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

    enum DirectionType {
      case above
      case below
      case left
      case right
    }
    
    // MARK: helpers
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

    func setX (_ alignment: XAlignmentType) -> NSLayoutAttribute {
        switch alignment {
            case .left:
                return NSLayoutAttribute.left
            case .right:
                return NSLayoutAttribute.right
            default:
                return NSLayoutAttribute.centerX
        }
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

    func setY (_ alignment: YAlignmentType) -> NSLayoutAttribute {
        switch alignment {
            case .top:
                return NSLayoutAttribute.top
            case .center:
                return NSLayoutAttribute.centerY
            default:
                return NSLayoutAttribute.bottom
        }
    }

    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    var widthConstraint : NSLayoutConstraint? {
        for constraint in self.constraints {
            if constraint.firstAttribute == .width {
                return constraint
            }
        }
        
        return nil
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    var heightConstraint : NSLayoutConstraint? {
        for constraint in self.constraints {
            if constraint.firstAttribute == .height {
                return constraint
            }
        }
        
        return nil
    }

    // MARK - Slim API
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func constrainChild( _ child: UIView, xAlignment: XAlignmentType, yAlignment: YAlignmentType, width: CGFloat?=nil, height: CGFloat?=nil, xOffset: CGFloat?=nil, yOffset: CGFloat?=nil) {
        child.translatesAutoresizingMaskIntoConstraints = false
        
        var xOff = xOffset == nil ? 0 : xOffset
        var yOff = yOffset == nil ? 0 : yOffset
        
        xOff = xAlignment == .right ? xOff?.negated() : xOff
        yOff = yAlignment == .bottom ? yOff?.negated() : yOff
        
        self.addConstraint(NSLayoutConstraint(item: child,
                                              attribute: setX(xAlignment),
                                              relatedBy: NSLayoutRelation.equal,
                                              toItem: self,
                                              attribute: setX(xAlignment),
                                              multiplier: 1.0,
                                              constant: xOff!))
        
        self.addConstraint(NSLayoutConstraint(item: child,
                                              attribute: setY(yAlignment),
                                              relatedBy: NSLayoutRelation.equal,
                                              toItem: self,
                                              attribute: setY(yAlignment),
                                              multiplier: 1.0,
                                              constant: yOff!))

        child.constrainSize(width: width, height: height)
    }

    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func constrainAbove(_ item: UIView, xAlignment: XAlignmentType, width: CGFloat?=nil, height: CGFloat?=nil, xOffset: CGFloat?=nil, yOffset: CGFloat?=nil) {
        self.constrainRelation(item,
                               direction: .above,
                               xAlignment: xAlignment,
                               xOffset: xOffset,
                               yOffset: yOffset)
    
        self.constrainSize(width: width, height: height)
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func constrainBelow(_ item: UIView, xAlignment: XAlignmentType, width: CGFloat?=nil, height: CGFloat?=nil, xOffset: CGFloat?=nil, yOffset: CGFloat?=nil) {
        self.constrainRelation(item,
                               direction: .below,
                               xAlignment: xAlignment,
                               xOffset: xOffset,
                               yOffset: yOffset)
        
        self.constrainSize(width: width, height: height)
    }

    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func constrainRightOf(_ item: UIView, yAlignment: YAlignmentType, width: CGFloat?=nil, height: CGFloat?=nil, xOffset: CGFloat?=nil, yOffset: CGFloat?=nil) {
        self.constrainRelation(item,
                               direction: .right,
                               yAlignment: yAlignment,
                               xOffset: xOffset,
                               yOffset: yOffset)
        
        self.constrainSize(width: width, height: height)
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func constrainLeftOf(_ item: UIView, yAlignment: YAlignmentType, width: CGFloat?=nil, height: CGFloat?=nil, xOffset: CGFloat?=nil, yOffset: CGFloat?=nil) {
        self.constrainRelation(item,
                               direction: .left,
                               yAlignment: yAlignment,
                               xOffset: xOffset,
                               yOffset: yOffset)
        
        self.constrainSize(width: width, height: height)
    }

    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func constrainRelation(_ item: UIView, direction: DirectionType, xAlignment: XAlignmentType?=nil, yAlignment: YAlignmentType?=nil, width: CGFloat?=nil, height: CGFloat?=nil, xOffset: CGFloat?=nil, yOffset: CGFloat?=nil) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        guard let parent = self.superview else {
            return
        }
        
        var xOff = xOffset == nil ? 0 : xOffset
        var yOff = yOffset == nil ? 0 : yOffset
        
        var att1 : NSLayoutAttribute
        var att2 : NSLayoutAttribute
        var att3 : NSLayoutAttribute
        var att4 : NSLayoutAttribute
        
        switch direction {
            case .above:
                att1 = setX(xAlignment!)
                att2 = setX(xAlignment!)
                att3 = NSLayoutAttribute.bottom
                att4 = NSLayoutAttribute.top
                yOff = yOff?.negated()

            case .below :
                att1 = setX(xAlignment!)
                att2 = setX(xAlignment!)
                att3 = NSLayoutAttribute.top
                att4 = NSLayoutAttribute.bottom
            
            case .right :
                att1 = NSLayoutAttribute.left
                att2 = NSLayoutAttribute.right
                att3 = setY(yAlignment!)
                att4 = setY(yAlignment!)
        
            case .left :
                att1 = NSLayoutAttribute.right
                att2 = NSLayoutAttribute.left
                att3 = setY(yAlignment!)
                att4 = setY(yAlignment!)
                xOff = xOff?.negated()
        }
        
        if yAlignment == .bottom {
            yOff = yOff?.negated()
        }
        
        parent.addConstraint(NSLayoutConstraint(item: self,
                                              attribute: att1,
                                              relatedBy: NSLayoutRelation.equal,
                                              toItem: item,
                                              attribute: att2,
                                              multiplier: 1.0,
                                              constant: xOff!))
        
        parent.addConstraint(NSLayoutConstraint(item: self,
                                              attribute: att3,
                                              relatedBy: NSLayoutRelation.equal,
                                              toItem: item,
                                              attribute: att4,
                                              multiplier: 1.0,
                                              constant: yOff!))
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func constrainSize( width: CGFloat?=nil, height: CGFloat?=nil ) {
        if width != nil {
            self.addConstraint(NSLayoutConstraint(item: self,
                                                  attribute: NSLayoutAttribute.width,
                                                  relatedBy: NSLayoutRelation.equal,
                                                  toItem: nil,
                                                  attribute: NSLayoutAttribute.notAnAttribute,
                                                  multiplier: 1.0,
                                                  constant: width!))
        }
        
        if height != nil {
            self.addConstraint(NSLayoutConstraint(item: self,
                                                  attribute: NSLayoutAttribute.height,
                                                  relatedBy: NSLayoutRelation.equal,
                                                  toItem: nil,
                                                  attribute: NSLayoutAttribute.notAnAttribute,
                                                  multiplier: 1.0,
                                                  constant: height!))
        }
    }
    
}
