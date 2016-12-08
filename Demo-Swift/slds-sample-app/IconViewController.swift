//
//  IconViewController.swift
//  slds-sample-app
//
//  Created by John Earle on 12/1/16.
//  Copyright © 2016 John Earle. All rights reserved.
//

import UIKit

class IconViewController: UIViewController {
    
    var iconSmall = UIImageView()
    var iconMedium = UIImageView()
    var iconLarge = UIImageView()
    var iconInfo = UILabel()
    var codeView = CodeView()
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    var dataProvider : IconObject? {
        didSet {
            guard var data = self.dataProvider else {
                return
            }
            
            data.size = SLDSSquareIconSmall
            iconSmall = UIImageView(image: data.getImage())
            
            data.size = SLDSSquareIconMedium
            iconMedium = UIImageView(image: data.getImage())
            
            data.size = SLDSSquareIconLarge
            iconLarge = UIImageView(image: data.getImage())
            
            self.iconInfo.text = data.name
            
            self.codeView.swiftString = "UIImage." + data.method + "(." + data.name + ",\n withSize: SLDSSquareIconMedium )"
            self.codeView.objCString = "[UIColor " + data.method + " :" + data.name + "\n withSize: SLDSSquareIconMedium ]"
        }
    }

    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = []
        self.view.backgroundColor = UIColor.white
        
        self.iconInfo.textAlignment = .center
        self.iconInfo.textColor = UIColor.sldsColorText(.default)
        self.iconInfo.font = UIFont.sldsFont(.regular, with: .small)
        self.view.addSubview(self.iconInfo)
        
        self.view.addSubview(codeView)
        self.view.constrainChild(self.codeView,
                                 xAlignment: .center,
                                 yAlignment: .bottom,
                                 width: self.view.frame.width,
                                 height: self.view.frame.height/3)
        
        self.view.addSubview(iconSmall)
        self.view.addSubview(iconMedium)
        self.view.addSubview(iconLarge)
        
        self.view.constrainChild(iconMedium,
                                 xAlignment: .center,
                                 yAlignment: .top,
                                 xOffset: -10,
                                 yOffset: 70)
        
        iconSmall.constrainLeftOf(iconMedium,
                                  yAlignment: .center,
                                  xOffset: 30)
        
        iconLarge.constrainRightOf(iconMedium,
                                    yAlignment: .center,
                                    xOffset: 30)
        
        self.view.constrainChild(self.iconInfo,
                                 xAlignment: .center,
                                 yAlignment: .top,
                                 yOffset: 140)
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
}
