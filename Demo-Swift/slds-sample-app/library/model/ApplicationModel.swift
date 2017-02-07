/*
 Copyright (c) 2016, salesforce.com, inc. All rights reserved.
 Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
 Neither the name of salesforce.com, inc. nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

import UIKit

class ApplicationModel: NSObject {
    
    static let sharedInstance = ApplicationModel()
    
    var showSwift : Bool = true
    
    // MARK: Color data management
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    var backgroundColors : Array<ColorObject> {
        return self.colorsFor(.background, first: SLDSBackgroundColorTypeFirst, last: SLDSBackgroundColorTypeLast)
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    var borderColors : Array<ColorObject> {
        return self.colorsFor(.border, first: SLDSBorderColorTypeFirst, last:SLDSBorderColorTypeLast)
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    var fillColors : Array<ColorObject> {
        return self.colorsFor(.fill, first: SLDSFillTypeFirst, last:SLDSFillTypeLast)
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    var textColors : Array<ColorObject> {
        return self.colorsFor(.text, first: SLDSTextColorTypeFirst, last: SLDSTextColorTypeLast)
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    private func sortHue ( c1: ColorObject, c2: ColorObject ) -> Bool {
        var h1:CGFloat = 0.0
        var s1:CGFloat = 0.0
        var b1:CGFloat = 0.0
        var a1:CGFloat = 0.0
        
        var h2:CGFloat = 0.0
        var s2:CGFloat = 0.0
        var b2:CGFloat = 0.0
        var a2:CGFloat = 0.0
        
        c1.color?.getHue(&h1, saturation: &s1, brightness: &b1, alpha: &a1)
        c2.color?.getHue(&h2, saturation: &s2, brightness: &b2, alpha: &a2)
        
        if a1 >= a2 - 0.05 || a1 < a2 + 0.05 {
            if h1 == h2 {
                if s1 >= s2 - 0.05 || s1 < s2 + 0.05 {
                    return b2 < b1
                } else {
                    return s1 < s2
                }
            } else {
                return h1 < h2
            }
        } else {
            return a1 < a2
        }
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    private func colorsFor(_ type: ColorObjectType, first:NSInteger, last:NSInteger ) -> Array<ColorObject> {

        var colorList = Array<ColorObject>()
        
        for index in first...last {
            let color = ColorObject(type: type, index: index)
            colorList.append(color)
        }

        return colorList.sorted(by: self.sortHue)
    }
    
    // MARK: Icon data management
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    var actionIcons : Array<IconObject> {
        return self.iconsFor( .action, first: SLDSActionIconTypeFirst, last: SLDSActionIconTypeLast )
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    var customIcons : Array<IconObject> {
        return self.iconsFor( .custom, first: SLDSCustomIconTypeFirst, last: SLDSCustomIconTypeLast )
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    var standardIcons : Array<IconObject> {
        return self.iconsFor( .standard, first: SLDSStandardIconTypeFirst, last: SLDSStandardIconTypeLast )
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    var utilityIcons : Array<IconObject> {
        return self.iconsFor( .utility, first: SLDSUtilityIconTypeFirst, last: SLDSUtilityIconTypeLast )
    }

    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    private func iconsFor(_ type : IconObjectType, first:NSInteger, last:NSInteger ) -> Array<IconObject> {
        
        var iconList = Array<IconObject>()
        
        for index in first...last {
            let icon = IconObject(type: type, index: index, size: SLDSSquareIconMedium)
            iconList.append(icon)
        }
        
        return iconList
    }
    
}
