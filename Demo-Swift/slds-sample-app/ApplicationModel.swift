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
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    var backgroundColors : Array<ColorObject> {
        return self.colorsFor(.background)
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    var borderColors : Array<ColorObject> {
        return self.colorsFor(.border)
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    var textColors : Array<ColorObject> {
        return self.colorsFor(.text)
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    var actionIcons : Array<IconObject> {
        return self.iconsFor( .action )
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    var customIcons : Array<IconObject> {
        return self.iconsFor( .custom )
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    var standardIcons : Array<IconObject> {
        return self.iconsFor( .standard )
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    var utilityIcons : Array<IconObject> {
        return self.iconsFor( .utility )
    }
    
    // MARK: Color data management
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
        
        if h1 == h2 {
            if s1 == s2 {
                if b1 == b2 {
                    return a2 < a1
                } else {
                    return b1 < b2
                }
            } else {
                return s1 < s2
            }
        } else {
            return h1 < h2
        }
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    private func colorsFor(_ type: ColorObjectType ) -> Array<ColorObject> {
        
        var index = 0
        var colorList = Array<ColorObject>()
        
        while let icon = self.colorFor( type, index: index) {
            colorList.append(icon)
            index = colorList.count
        }
        
        return colorList.sorted(by: self.sortHue)
    }

    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    private func colorFor( _ type: ColorObjectType, index: NSInteger) -> ColorObject? {
        
        switch type {
        case .background :
            if index > 0 && (SLDSColorBackgroundType.init(rawValue: index)?.hashValue == 0) {
                return nil
            }
            
        case .border :
            if index > 0 && (SLDSColorBorderType.init(rawValue: index+1)?.hashValue == 0) {
                return nil
            }
    
        case .text :
            if index > 0 && (SLDSColorTextType.init(rawValue: index)?.hashValue == 0) {
                return nil
            }
        }
        
        return ColorObject(type: type, index: index)
    }

    
    // MARK: Icon data management
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    private func iconsFor(_ type : IconObjectType ) -> Array<IconObject> {
        
        var index = 0
        var iconList = Array<IconObject>()
        
        while let icon = self.iconFor( type, index: index) {
            iconList.append(icon)
            index = iconList.count
        }
        
        return iconList
    }

    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    private func iconFor(_ type : IconObjectType, index:NSInteger) -> IconObject? {
        
        switch type {
        case .action :
            if index > 0 && (SLDSIconActionType.init(rawValue: index)?.hashValue == 0) {
                return nil
            }
        
        case .custom :
            if index > 0 && (SLDSIconCustomType.init(rawValue: index)?.hashValue == 0) {
                return nil
            }
        
        case .standard :
            if index > 0 && (SLDSIconStandardType.init(rawValue: index)?.hashValue == 0) {
                return nil
            }
        
        case .utility :
            if index > 0 && (SLDSIconUtilityType.init(rawValue: index)?.hashValue == 0) {
                return nil
            }
        }
        
        let size = type == .utility ? SLDSSquareIconUtilityLarge : SLDSSquareIconMedium
        return IconObject(type: type, index: index, size: size)
    }
    
}
