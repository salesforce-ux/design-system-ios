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
      case up
      case down
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
 
    func constrain(_ item: UIView, verticallyTo: UIView, xAlignment: XAlignmentType, direction: DirectionType, width: CGFloat?=nil, height: CGFloat?=nil, xOffset: CGFloat?=nil, yOffset: CGFloat?=nil) {
        item.translatesAutoresizingMaskIntoConstraints = false
        let constraints = self.constraintsFor(item,
                                              verticallyTo:verticallyTo,
                                              xAlignment: xAlignment,
                                              direction: direction,
                                              //width: width,
                                              //height: height,
                                              xOffset: xOffset,
                                              yOffset: yOffset)
        self.addConstraints(constraints)
        self.constrain(item, width: width, height: height)
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
 
    func constraintsFor(_ item: UIView, verticallyTo: UIView, xAlignment: XAlignmentType, direction: DirectionType, width: CGFloat?=nil, height: CGFloat?=nil, xOffset: CGFloat?=nil, yOffset: CGFloat?=nil) -> Array<NSLayoutConstraint> {
        
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
        
        constraints.append(contentsOf: self.constraintsFor(item, width: width, height: height))
        return constraints
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func constrain(_ item: UIView, horizontallyTo: UIView, yAlignment: YAlignmentType, direction: DirectionType, width: CGFloat?=nil, height: CGFloat?=nil, xOffset: CGFloat?=nil, yOffset: CGFloat?=nil) {
        item.translatesAutoresizingMaskIntoConstraints = false
        let constraints = self.constraintsFor(item,
                                              horizontallyTo:horizontallyTo,
                                              yAlignment: yAlignment,
                                              direction: direction,
                                              //width: width,
                                              //height: height,
                                              xOffset: xOffset,
                                              yOffset: yOffset)
        self.addConstraints(constraints)
        self.constrain(item, width: width, height: height)
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

    func constraintsFor(_ item: UIView, horizontallyTo: UIView, yAlignment: YAlignmentType, direction: DirectionType, width: CGFloat?=nil, height: CGFloat?=nil, xOffset: CGFloat?=nil, yOffset: CGFloat?=nil) -> Array<NSLayoutConstraint> {
        
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
        
        constraints.append(contentsOf: self.constraintsFor(item, width: width, height: height))
        return constraints
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

    func constrain(_ item: UIView, inside: UIView, xAlignment: XAlignmentType, yAlignment: YAlignmentType, width: CGFloat?=nil, height: CGFloat?=nil, xOffset: CGFloat?=nil, yOffset: CGFloat?=nil) {
        item.translatesAutoresizingMaskIntoConstraints = false
        let constraints = self.constraintsFor(item,
                                              inside: inside,
                                              xAlignment: xAlignment,
                                              yAlignment: yAlignment,
                                              //width: width,
                                              //height: height,
                                              xOffset: xOffset,
                                              yOffset: yOffset)
        self.addConstraints(constraints)
        self.constrain(item, width: width, height: height)
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func constraintsFor(_ item: UIView, inside: UIView, xAlignment: XAlignmentType, yAlignment: YAlignmentType, width: CGFloat?=nil, height: CGFloat?=nil, xOffset: CGFloat?=nil, yOffset: CGFloat?=nil) -> Array<NSLayoutConstraint> {
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
        
        constraints.append(contentsOf: self.constraintsFor(item, width: width, height: height))
        return constraints
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func constrain(_ item: UIView, width: CGFloat?=nil, height: CGFloat?=nil ) {
        item.translatesAutoresizingMaskIntoConstraints = false
        item.addConstraints(self.constraintsFor(item, width: width, height: height))
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func constraintsFor(_ item: UIView, width: CGFloat?=nil, height: CGFloat?=nil ) -> Array<NSLayoutConstraint> {
        
        var constraints = Array<NSLayoutConstraint>()
        
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
