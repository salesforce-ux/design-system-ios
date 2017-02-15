// Copyright (c) 2015-present, salesforce.com, inc. All rights reserved
// Licensed under BSD 3-Clause - see LICENSE.txt or git.io/sfdc-license

import UIKit

//––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

enum ColorObjectType : String {
    case background = "Background"
    case border = "Border"
    case fill = "Fill"
    case text = "Text"
}

//––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

struct ColorObject {
    var type : ColorObjectType
    var index : NSInteger
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    var color : UIColor? {
        
        switch self.type {
        case .background :
            if let value = SLDSBackgroundColorType.init(rawValue: self.index) {
                return UIColor.sldsBackgroundColor(value)
            }
            
        case .border :
            if let value = SLDSBorderColorType.init(rawValue: self.index) {
                return UIColor.sldsBorderColor(value)
            }
            
        case .fill :
            if let value = SLDSFillType.init(rawValue: self.index) {
                return UIColor.sldsFill(value)
            }
            
        case .text :
            if let value = SLDSTextColorType.init(rawValue: self.index) {
                return UIColor.sldsTextColor(value)
            }
        }
        
        return nil
    }

    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    var method : String {
        
        switch self.type {
        case .background :
            return "sldsBackgroundColor"
            
        case .border :
            return "sldsBorderColor"
            
        case .fill :
            return "sldsFill"
            
        case .text :
            return "sldsTextColor"
        }
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

    var name : String {
        return NSString.sldsColorName(self.index)
    }

}
