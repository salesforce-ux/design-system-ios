/*
 Copyright (c) 2016, salesforce.com, inc. All rights reserved.
 Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
 Neither the name of salesforce.com, inc. nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

import UIKit

//––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

enum ColorObjectType : String {
    case background = "Background"
    case border = "Border"
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
            
        case .text :
            return "sldsTextColor"
        }
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

    var name : String {
        var retVal = ""
     
        switch self.type {
        case .background :
            if let value = SLDSBackgroundColorType.init(rawValue: self.index) {
            //    retVal = NSString.sldsColorBackgroundName(value) as String
            }
            
        case .border :
            if let value = SLDSBorderColorType.init(rawValue: self.index) {
            //    retVal = NSString.sldsColorBorderName(value) as String
            }
            
        case .text :
            if let value = SLDSTextColorType.init(rawValue: self.index) {
            //    retVal = NSString.sldsColorTextName(value) as String
            }
        }
        
        return retVal
    }

}
