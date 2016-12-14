/*
 Copyright (c) 2016, salesforce.com, inc. All rights reserved.
 Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
 Neither the name of salesforce.com, inc. nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

import UIKit

enum IconObjectType : String {
    case action = "Action"
    case custom = "Custom"
    case standard = "Standard"
    case utility = "Utility"
}

struct IconObject {
    var type : IconObjectType
    var index: NSInteger
    var size : CGFloat = 0.0
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    var method : String {
        
        switch self.type {
        case .action :
            return "sldsIconAction"
        
        case .custom :
            return "sldsIconCustom"

        case .standard :
            return "sldsIconStandard"
            
        case .utility :
            return "sldsIconUtility"
        }
    }

    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    var name : String {
        var retVal = ""
        
        switch self.type {
        case .action :
            if let value = SLDSIconActionType.init(rawValue: self.index) {
                retVal = NSString.sldsIconAction(value) as String
            }
            
        case .custom :
            if let value = SLDSIconCustomType.init(rawValue: self.index) {
                retVal = NSString.sldsIconCustom(value) as String
            }
            
        case .standard :
            if let value = SLDSIconStandardType.init(rawValue: self.index) {
                retVal = NSString.sldsIconStandard(value) as String
            }
            
        case .utility :
            if let value = SLDSIconUtilityType.init(rawValue: self.index) {
                retVal = NSString.sldsIconUtility(value) as String
            }
        }
        return retVal
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func getImage(backgroundColor : UIColor?=nil ) -> UIImage? {
        if self.type != .utility && backgroundColor != nil {
            fatalError("In the SLDSSampleApp, only utility icons use backgroundColor, though all slds icon types support the use of backgroundColor.")
        }
        
        switch self.type {
        case .action :
            if let value = SLDSIconActionType.init(rawValue: self.index) {
                return UIImage.sldsIconAction(value, withSize: self.size)
            }
            
        case .custom :
            if let value = SLDSIconCustomType.init(rawValue: self.index) {
                return UIImage.sldsIconCustom(value, withSize: self.size)
            }
            
        case .standard :
            if let value = SLDSIconStandardType.init(rawValue: index) {
                return UIImage.sldsIconStandard(value, withSize: self.size)
            }
            
        case .utility :
            if let value = SLDSIconUtilityType.init(rawValue: self.index) {
                return UIImage.sldsIconUtility(value, with: backgroundColor, andSize: self.size)
            }
        }
        
        return nil
    }
}
