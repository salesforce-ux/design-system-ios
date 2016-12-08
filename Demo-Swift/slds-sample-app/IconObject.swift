//
//  IconObject.swift
//  slds-sample-app
//
//  Created by Joe Andolina on 12/7/16.
//  Copyright © 2016 John Earle. All rights reserved.
//

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
            fatalError("In the SLDSSample App - Only utility icons use backgroundColor, though all slds icon types support the use of backgroundColor.")
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
