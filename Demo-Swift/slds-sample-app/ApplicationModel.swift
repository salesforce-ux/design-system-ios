//
//  ApplicationModel.swift
//  slds-sample-app
//
//  Created by Joe Andolina on 12/8/16.
//  Copyright © 2016 John Earle. All rights reserved.
//

import UIKit

class ApplicationModel: NSObject {
    
    static let sharedInstance = ApplicationModel()

    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    var actionIcons : Array<IconObject> {
        return self.iconsFor(type: .action)
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    var customIcons : Array<IconObject> {
        return self.iconsFor(type: .custom)
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    var standardIcons : Array<IconObject> {
        return self.iconsFor(type: .standard)
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    var utilityIcons : Array<IconObject> {
        return self.iconsFor(type: .utility)
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    private func iconsFor( type : IconObjectType ) -> Array<IconObject> {
        
        var index = 0
        var iconList = Array<IconObject>()
        
        while let icon = self.iconFor(type: type, index: index) {
            iconList.append(icon)
            index = iconList.count
        }
        
        return iconList
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    private func iconFor( type : IconObjectType, index:NSInteger) -> IconObject? {
        
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
