//
//  ConstraintsHelper.swift
//  slds-sample-app
//
//  Created by John Earle on 11/9/16.
//  Copyright © 2016 John Earle. All rights reserved.
//

import Foundation

extension UIView {
    
    enum XAlignmentType {
        case left
        case center
        case right
    }
    
    enum YAlignmentType {
        case top
        case center
        case bottom
    }

    enum DirectionType {
      case up
      case down
      case left
      case right
    }
    
    // MARK: helpers
    
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
    
    func constrain(_ item: UIView, verticallyTo: UIView, xAlignment: XAlignmentType, direction: DirectionType, width: CGFloat?=nil, height: CGFloat?=nil, xOffset: CGFloat?=nil, yOffset: CGFloat?=nil) {
        
        item.translatesAutoresizingMaskIntoConstraints = false
        
        var constraints = Array<NSLayoutConstraint>()
        
        let xOff = xOffset == nil ? 0 : xOffset
        var yOff = yOffset == nil ? 0 : yOffset

        var yAtt1 = NSLayoutAttribute.top
        var yAtt2 = NSLayoutAttribute.bottom
        
        if direction == .up {
            yAtt1 = NSLayoutAttribute.bottom
            yAtt2 = NSLayoutAttribute.top
            yOff = yOff?.negated()
        }
        
        constraints.append(NSLayoutConstraint(item: item,
                                                  attribute: setX(xAlignment),
                                                  relatedBy: NSLayoutRelation.equal,
                                                  toItem: verticallyTo,
                                                  attribute: setX(xAlignment),
                                                  multiplier: 1.0,
                                                  constant: xOff!))
        
        
        constraints.append(NSLayoutConstraint(item: item,
                                   attribute: yAtt1,
                                   relatedBy: NSLayoutRelation.equal,
                                   toItem: verticallyTo,
                                   attribute: yAtt2,
                                   multiplier: 1.0,
                                   constant: yOff!))
        
        if width != nil {
            constraints.append(NSLayoutConstraint(item: item,
                                                  attribute: NSLayoutAttribute.width,
                                                  relatedBy: NSLayoutRelation.equal,
                                                  toItem: nil,
                                                  attribute: NSLayoutAttribute.notAnAttribute,
                                                  multiplier: 1.0,
                                                  constant: width!))
        }
        
        if height != nil {
            constraints.append(NSLayoutConstraint(item: item,
                                                  attribute: NSLayoutAttribute.height,
                                                  relatedBy: NSLayoutRelation.equal,
                                                  toItem: nil,
                                                  attribute: NSLayoutAttribute.notAnAttribute,
                                                  multiplier: 1.0,
                                                  constant: height!))
        }
        
        self.addConstraints(constraints)
    }
    
    func constrain(_ item: UIView, horizontallyTo: UIView, yAlignment: YAlignmentType, direction: DirectionType, width: CGFloat?=nil, height: CGFloat?=nil, xOffset: CGFloat?=nil, yOffset: CGFloat?=nil) {
        
        item.translatesAutoresizingMaskIntoConstraints = false
        
        var constraints = Array<NSLayoutConstraint>()
        
        var xOff = xOffset == nil ? 0 : xOffset
        let yOff = yOffset == nil ? 0 : yOffset
        
        var xAtt1 = NSLayoutAttribute.left
        var xAtt2 = NSLayoutAttribute.right
        
        if direction == .left {
            xAtt1 = NSLayoutAttribute.right
            xAtt2 = NSLayoutAttribute.left
            xOff = xOff?.negated()
        }
        
        constraints.append(NSLayoutConstraint(item: item,
                                   attribute: xAtt1,
                                   relatedBy: NSLayoutRelation.equal,
                                   toItem: horizontallyTo,
                                   attribute: xAtt2,
                                   multiplier: 1.0,
                                   constant: xOff!))
    
        constraints.append(NSLayoutConstraint(item: item,
                                   attribute: setY(yAlignment),
                                   relatedBy: NSLayoutRelation.equal,
                                   toItem: horizontallyTo,
                                   attribute: setY(yAlignment),
                                   multiplier: 1.0,
                                   constant: yOff!))
        
        if width != nil {
            constraints.append(NSLayoutConstraint(item: item,
                                                  attribute: NSLayoutAttribute.width,
                                                  relatedBy: NSLayoutRelation.equal,
                                                  toItem: nil,
                                                  attribute: NSLayoutAttribute.notAnAttribute,
                                                  multiplier: 1.0,
                                                  constant: width!))
        }
        
        if height != nil {
            constraints.append(NSLayoutConstraint(item: item,
                                                  attribute: NSLayoutAttribute.height,
                                                  relatedBy: NSLayoutRelation.equal,
                                                  toItem: nil,
                                                  attribute: NSLayoutAttribute.notAnAttribute,
                                                  multiplier: 1.0,
                                                  constant: height!))
        }
        
        
        self.addConstraints(constraints)
    }
    
    func constrain(_ item: UIView, inside: UIView, xAlignment: XAlignmentType, yAlignment: YAlignmentType, width: CGFloat?=nil, height: CGFloat?=nil, xOffset: CGFloat?=nil, yOffset: CGFloat?=nil) {
        
        item.translatesAutoresizingMaskIntoConstraints = false
        
        var constraints = Array<NSLayoutConstraint>()
        
        var xOff = xOffset == nil ? 0 : xOffset
        var yOff = yOffset == nil ? 0 : yOffset
        
        xOff = xAlignment == .right ? xOff?.negated() : xOff
        yOff = yAlignment == .bottom ? yOff?.negated() : yOff
        
        constraints.append(NSLayoutConstraint(item: item,
                                   attribute: setX(xAlignment),
                                   relatedBy: NSLayoutRelation.equal,
                                   toItem: inside,
                                   attribute: setX(xAlignment),
                                   multiplier: 1.0,
                                   constant: xOff!))
        
        constraints.append(NSLayoutConstraint(item: item,
                                   attribute: setY(yAlignment),
                                   relatedBy: NSLayoutRelation.equal,
                                   toItem: inside,
                                   attribute: setY(yAlignment),
                                   multiplier: 1.0,
                                   constant: yOff!))
        
        if width != nil {
            constraints.append(NSLayoutConstraint(item: item,
                                                  attribute: NSLayoutAttribute.width,
                                                  relatedBy: NSLayoutRelation.equal,
                                                  toItem: nil,
                                                  attribute: NSLayoutAttribute.notAnAttribute,
                                                  multiplier: 1.0,
                                                  constant: width!))
        }
        
        if height != nil {
            constraints.append(NSLayoutConstraint(item: item,
                                                  attribute: NSLayoutAttribute.height,
                                                  relatedBy: NSLayoutRelation.equal,
                                                  toItem: nil,
                                                  attribute: NSLayoutAttribute.notAnAttribute,
                                                  multiplier: 1.0,
                                                  constant: height!))
        }
        
        self.addConstraints(constraints)
    }
}
