//
//  ConstraintsHelper.swift
//  slds-sample-app
//
//  Created by John Earle on 11/9/16.
//  Copyright © 2016 John Earle. All rights reserved.
//

import Foundation

class ConstraintsHelper {
    
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
    
    enum VDirectionType {
        case up
        case down
    }
    
    enum HDirectionType {
        case right
        case left
    }
    
    // MARK: helpers
    
    static func setX (_ alignment: XAlignmentType) -> NSLayoutAttribute {
        switch alignment {
            case .left:
                return NSLayoutAttribute.left
            case .right:
                return NSLayoutAttribute.right
            default:
                return NSLayoutAttribute.centerX
        }
    }
    
    static func setY (_ alignment: YAlignmentType) -> NSLayoutAttribute {
        switch alignment {
            case .top:
                return NSLayoutAttribute.top
            case .center:
                return NSLayoutAttribute.centerY
            default:
                return NSLayoutAttribute.bottom
        }
    }
    
    static func stackV(item: UIView, toItem: UIView, width: CGFloat?=nil, height: CGFloat?=nil, xAlignment: XAlignmentType, direction: VDirectionType, xOffset: CGFloat, yOffset: CGFloat) -> Array<NSLayoutConstraint> {
        
        item.translatesAutoresizingMaskIntoConstraints = false
        
        var constraints = Array<NSLayoutConstraint>()
        
        var yOff = yOffset
        var yAtt1 = NSLayoutAttribute.top
        var yAtt2 = NSLayoutAttribute.bottom
        
        if direction == .up {
            yAtt1 = NSLayoutAttribute.bottom
            yAtt2 = NSLayoutAttribute.top
        }
        else {
            yOff = -yOff
        }
        
        
        constraints.append(NSLayoutConstraint(item: item,
                                                  attribute: setX(xAlignment),
                                                  relatedBy: NSLayoutRelation.equal,
                                                  toItem: toItem,
                                                  attribute: setX(xAlignment),
                                                  multiplier: 1.0,
                                                  constant: xOffset))
        
        
        constraints.append(NSLayoutConstraint(item: item,
                                   attribute: yAtt1,
                                   relatedBy: NSLayoutRelation.equal,
                                   toItem: toItem,
                                   attribute: yAtt2,
                                   multiplier: 1.0,
                                   constant: yOff))
        
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
        
        return constraints
    }
    
    static func stackH(item: UIView, toItem: UIView, width: CGFloat?=nil, height: CGFloat?=nil, yAlignment: YAlignmentType, direction: HDirectionType, xOffset: CGFloat, yOffset: CGFloat) -> Array<NSLayoutConstraint> {
        
        item.translatesAutoresizingMaskIntoConstraints = false
        
        var constraints = Array<NSLayoutConstraint>()
        
        var xOff = xOffset
        var xAtt1 = NSLayoutAttribute.right
        var xAtt2 = NSLayoutAttribute.left
        
        if direction == .left {
            xAtt1 = NSLayoutAttribute.left
            xAtt2 = NSLayoutAttribute.right
        }
        else
        {
            xOff = -xOff
        }
        
        constraints.append(NSLayoutConstraint(item: item,
                                   attribute: xAtt1,
                                   relatedBy: NSLayoutRelation.equal,
                                   toItem: toItem,
                                   attribute: xAtt2,
                                   multiplier: 1.0,
                                   constant: xOff))
    
        constraints.append(NSLayoutConstraint(item: item,
                                   attribute: setY(yAlignment),
                                   relatedBy: NSLayoutRelation.equal,
                                   toItem: toItem,
                                   attribute: setY(yAlignment),
                                   multiplier: 1.0,
                                   constant: yOffset))
        
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
        
        
        return constraints
    }
    
    static func addConstraints(item: UIView, toItem: UIView, width: CGFloat?=nil, height: CGFloat?=nil, xAlignment: XAlignmentType, yAlignment: YAlignmentType, xOffset: CGFloat, yOffset: CGFloat) -> Array<NSLayoutConstraint> {
        
        item.translatesAutoresizingMaskIntoConstraints = false
        
        var constraints = Array<NSLayoutConstraint>()
        
        let xOff = xAlignment == .right ? -xOffset : xOffset
        let yOff = yAlignment == .bottom ? -yOffset : yOffset
        
        constraints.append(NSLayoutConstraint(item: item,
                                   attribute: setX(xAlignment),
                                   relatedBy: NSLayoutRelation.equal,
                                   toItem: toItem,
                                   attribute: setX(xAlignment),
                                   multiplier: 1.0,
                                   constant: xOff))
        
        constraints.append(NSLayoutConstraint(item: item,
                                   attribute: setY(yAlignment),
                                   relatedBy: NSLayoutRelation.equal,
                                   toItem: toItem,
                                   attribute: setY(yAlignment),
                                   multiplier: 1.0,
                                   constant: yOff))
        
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
        
        return constraints
    }
}
