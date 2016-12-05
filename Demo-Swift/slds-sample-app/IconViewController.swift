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
    
    var iconContainer = UIView()
    
    
    var sampleText = UILabel()
    var fontInfo = UITextView()
    var codeView = CodeView()
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.edgesForExtendedLayout = []
        self.view.backgroundColor = UIColor.white
        
        self.sampleText.text = "AaBbCc"
        self.sampleText.textAlignment = .center
        self.sampleText.contentMode = .center
        self.sampleText.textColor = UIColor.sldsColorText(.default)
        self.sampleText.backgroundColor = UIColor.clear
        self.view.addSubview(self.sampleText)
        
        self.fontInfo.textAlignment = .center
        self.fontInfo.isEditable = false
        self.fontInfo.backgroundColor = UIColor.clear
        self.fontInfo.textColor = UIColor.sldsColorText(.default)
        self.fontInfo.font = UIFont.sldsFont(.regular, with: .small)
        self.view.addSubview(self.fontInfo)
        
        self.view.addSubview(codeView)
        
        self.view.constrain(self.codeView,
                            inside: self.view,
                            xAlignment: .center,
                            yAlignment: .bottom,
                            width: self.view.frame.width,
                            height: self.view.frame.height/2)
        
        self.view.addSubview(self.iconContainer)
        self.view.constrain(self.iconContainer,
                            inside: self.view,
                            xAlignment: .center,
                            yAlignment: .top,
                            width: 10 + SLDSSquareIconSmall + SLDSSquareIconMedium + SLDSSquareIconLarge,
                            height: 48,
                            yOffset: 50 )
        
        iconSmall = UIImageView(image: UIImage.sldsIconAction(.addContact, withSize: SLDSSquareIconSmall))
        iconMedium = UIImageView(image: UIImage.sldsIconAction(.addContact, withSize: SLDSSquareIconMedium))
        iconLarge = UIImageView(image: UIImage.sldsIconAction(.addContact, withSize: SLDSSquareIconLarge))
        
        
        self.view.addSubview(iconSmall)
        self.view.addSubview(iconMedium)
        self.view.addSubview(iconLarge)
        
        self.view.constrain(iconSmall,
                            inside: self.iconContainer,
                            xAlignment: .left,
                            yAlignment: .center,
                            yOffset: 50 )
        
        self.view.constrain(iconMedium,
                       horizontallyTo: iconSmall,
                       yAlignment: .center,
                       direction: .right,
                       xOffset: 5,
                       yOffset: 0)
        
        self.view.constrain(iconLarge,
                            horizontallyTo: iconMedium,
                            yAlignment: .center,
                            direction: .right,
                            xOffset: 5,
                            yOffset: 0)
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func enumName(name :String) -> String {
        var newName = name.replacingOccurrences(of: "SLDSFontType", with: "")
        newName = newName.replacingOccurrences(of: "SLDSFontSize", with: "")
        let first = String(newName.characters.prefix(1)).lowercased()
        var second = String(newName.characters.prefix(2).dropFirst())
        
        if second == "X" {
            second = second.lowercased()
        }
        
        return "." + first + second + String(newName.characters.dropFirst(2))
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
}
