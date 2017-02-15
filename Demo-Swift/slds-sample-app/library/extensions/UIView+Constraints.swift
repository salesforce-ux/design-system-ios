// Copyright (c) 2015-present, salesforce.com, inc. All rights reserved
// Licensed under BSD 3-Clause - see LICENSE.txt or git.io/sfdc-license

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
                return .left
            case .right:
                return .right
            default:
                return .centerX
        }
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

    func setY (_ alignment: YAlignmentType) -> NSLayoutAttribute {
        switch alignment {
            case .top:
                return .top
            case .center:
                return .centerY
            default:
                return .bottom
        }
    }

    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    var widthConstraint : NSLayoutConstraint {
        for constraint in self.constraints {
            if constraint.firstAttribute == .width {
                return constraint
            }
        }
        
        self.constrainSize(width: 0)
        return self.widthConstraint
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    var heightConstraint : NSLayoutConstraint {
        for constraint in self.constraints {
            if constraint.firstAttribute == .height {
                return constraint
            }
        }
        
        self.constrainSize(height: 0)
        return self.heightConstraint
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
                                              relatedBy: .equal,
                                              toItem: self,
                                              attribute: setX(xAlignment),
                                              multiplier: 1.0,
                                              constant: xOff!))
        
        self.addConstraint(NSLayoutConstraint(item: child,
                                              attribute: setY(yAlignment),
                                              relatedBy: .equal,
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
                att3 = .bottom
                att4 = .top
                yOff = yOff?.negated()

            case .below :
                att1 = setX(xAlignment!)
                att2 = setX(xAlignment!)
                att3 = .top
                att4 = .bottom
            
            case .right :
                att1 = .left
                att2 = .right
                att3 = setY(yAlignment!)
                att4 = setY(yAlignment!)
        
            case .left :
                att1 = .right
                att2 = .left
                att3 = setY(yAlignment!)
                att4 = setY(yAlignment!)
                xOff = xOff?.negated()
        }
        
        if yAlignment == .bottom {
            yOff = yOff?.negated()
        }
        
        parent.addConstraint(NSLayoutConstraint(item: self,
                                              attribute: att1,
                                              relatedBy: .equal,
                                              toItem: item,
                                              attribute: att2,
                                              multiplier: 1.0,
                                              constant: xOff!))
        
        parent.addConstraint(NSLayoutConstraint(item: self,
                                              attribute: att3,
                                              relatedBy: .equal,
                                              toItem: item,
                                              attribute: att4,
                                              multiplier: 1.0,
                                              constant: yOff!))
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func constrainSize( width: CGFloat?=nil, height: CGFloat?=nil ) {
        if width != nil {
            self.addConstraint(NSLayoutConstraint(item: self,
                                                  attribute: .width,
                                                  relatedBy: .equal,
                                                  toItem: nil,
                                                  attribute: .notAnAttribute,
                                                  multiplier: 1.0,
                                                  constant: width!))
        }
        
        if height != nil {
            self.addConstraint(NSLayoutConstraint(item: self,
                                                  attribute: .height,
                                                  relatedBy: .equal,
                                                  toItem: nil,
                                                  attribute: .notAnAttribute,
                                                  multiplier: 1.0,
                                                  constant: height!))
        }
    }
    
}
