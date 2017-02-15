// Copyright (c) 2015-present, salesforce.com, inc. All rights reserved
// Licensed under BSD 3-Clause - see LICENSE.txt or git.io/sfdc-license

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
            return "sldsActionIcon"
        
        case .custom :
            return "sldsCustomIcon"

        case .standard :
            return "sldsStandardIcon"
            
        case .utility :
            return "sldsUtilityIcon"
        }
    }

    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    var name : String {
        return NSString.sldsIconName(index)
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func getImage() -> UIImage? {
        
        switch self.type {
        case .action :
            if let value = SLDSActionIconType.init(rawValue: self.index) {
                return UIImage.sldsActionIcon(value, withSize: self.size)
            }
            
        case .custom :
            if let value = SLDSCustomIconType.init(rawValue: self.index) {
                return UIImage.sldsCustomIcon(value, withSize: self.size)
            }
            
        case .standard :
            if let value = SLDSStandardIconType.init(rawValue: index) {
                return UIImage.sldsStandardIcon(value, withSize: self.size)
            }
            
        case .utility :
            if let value = SLDSUtilityIconType.init(rawValue: self.index) {
                return UIImage.sldsUtilityIcon(value, with: UIColor.sldsFill(.brandActive), andSize: self.size)
            }
        }
        
        return nil
    }
}
