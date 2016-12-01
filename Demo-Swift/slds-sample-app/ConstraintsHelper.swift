//
//  ConstraintsHelper.swift
//  slds-sample-app
//
//  Created by John Earle on 11/9/16.
//  Copyright © 2016 John Earle. All rights reserved.
//

import Foundation

class ConstraintsHelper {
    
    // MARK: helpers
    
    static func setX (_ alignment: String) -> NSLayoutAttribute {
        switch alignment {
        case "left":
            return NSLayoutAttribute.left
        case "right":
            return NSLayoutAttribute.right
        case "center":
            return NSLayoutAttribute.centerX
        default:
            return NSLayoutAttribute.left
        }
    }
    
    static func setY (_ alignment: String) -> NSLayoutAttribute {
        switch alignment {
        case "top":
            return NSLayoutAttribute.top
        case "bottom":
            return NSLayoutAttribute.bottom
        case "center":
            return NSLayoutAttribute.centerY
        default:
            return NSLayoutAttribute.top
        }
    }
    
    static func stackV(item: UIView, toItem: UIView, width: CGFloat?=nil, height: CGFloat?=nil, xAlignment: String, direction: String, xOffset: CGFloat, yOffset: CGFloat) -> Array<NSLayoutConstraint> {
        
        item.translatesAutoresizingMaskIntoConstraints = false
        
        var constraints = Array<NSLayoutConstraint>()
        
        var yAtt1 = NSLayoutAttribute.top
        var yAtt2 = NSLayoutAttribute.bottom
        
        if direction == "up" {
            yAtt1 = NSLayoutAttribute.bottom
            yAtt2 = NSLayoutAttribute.top
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
    
    static func stackH(item: UIView, toItem: UIView, width: CGFloat?=nil, height: CGFloat?=nil, yAlignment: String, direction: String, xOffset: CGFloat, yOffset: CGFloat) -> Array<NSLayoutConstraint> {
        
        item.translatesAutoresizingMaskIntoConstraints = false
        
        var constraints = Array<NSLayoutConstraint>()
        
        var xAtt1 = NSLayoutAttribute.right
        var xAtt2 = NSLayoutAttribute.left
        
        if direction == "left" {
            xAtt1 = NSLayoutAttribute.left
            xAtt2 = NSLayoutAttribute.right
        }
        
        constraints.append(NSLayoutConstraint(item: item,
                                   attribute: xAtt1,
                                   relatedBy: NSLayoutRelation.equal,
                                   toItem: toItem,
                                   attribute: xAtt2,
                                   multiplier: 1.0,
                                   constant: xOffset))
    
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
    
    static func addConstraints(item: UIView, toItem: UIView, width: CGFloat?=nil, height: CGFloat?=nil, xAlignment: String, yAlignment: String, xOffset: CGFloat, yOffset: CGFloat) -> Array<NSLayoutConstraint> {
        
        item.translatesAutoresizingMaskIntoConstraints = false
        
        var constraints = Array<NSLayoutConstraint>()
        
        constraints.append(NSLayoutConstraint(item: item,
                                   attribute: setX(xAlignment),
                                   relatedBy: NSLayoutRelation.equal,
                                   toItem: toItem,
                                   attribute: setX(xAlignment),
                                   multiplier: 1.0,
                                   constant: xOffset))
        
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
}
