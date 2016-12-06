//
//  NavBar.swift
//  slds-sample-app
//
//  Created by John Earle on 12/5/16.
//  Copyright © 2016 John Earle. All rights reserved.
//

import Foundation

class TabBar: UITabBar {
    
    let hr = UIView()
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        applyStyle()
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func applyStyle() {
        self.backgroundColor = UIColor.sldsColorBackground(.backgroundAlt)
        
        let filterButton = UITabBarItem()
        
        // round edges of icon
        var actionIcon = UIImage.sldsIconAction(.filter, withSize: SLDSSquareIconMedium)
        UIGraphicsBeginImageContextWithOptions(CGSize(width: SLDSSquareIconMedium, height: SLDSSquareIconMedium), false, 1.0)
        UIBezierPath(roundedRect: CGRect(x:0, y:0, width: SLDSSquareIconMedium, height: SLDSSquareIconMedium), cornerRadius: SLDSSquareIconMedium/2).addClip()
        actionIcon?.draw(in: CGRect(x:0, y:0, width: SLDSSquareIconMedium, height: SLDSSquareIconMedium))
        actionIcon = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        filterButton.image = newActionIcon.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        filterButton.title = "Filter"
        
        let items = [filterButton]
        
        self.setItems(items, animated: true)
    }
}
