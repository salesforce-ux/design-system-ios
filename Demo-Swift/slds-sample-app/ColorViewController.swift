//
//  AccountViewController.swift
//  slds-sample-app
//
//  Created by John Earle on 11/14/16.
//  Copyright © 2016 John Earle. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController {
    
    var backgroundExample = UIView()
    var checkeredBackground = UIView()
    var bottomAnchor = UIView()
    var textExample = UILabel()
    var copyButton = UIButton()
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func viewDidLoad() {
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask { return UIInterfaceOrientationMask.portrait }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func addColor(_ color:UIColor, _ alias:String) {
        
        // color swatch
        
        self.view.addSubview(checkeredBackground)
        checkeredBackground.addSubview(backgroundExample)
        
        var h1:CGFloat = 0.0
        var s1:CGFloat = 0.0
        var b1:CGFloat = 0.0
        var a1:CGFloat = 0.0
        
        color.getHue(&h1, saturation: &s1, brightness: &b1, alpha: &a1)
        
        if a1 < 1 {
            checkeredBackground.backgroundColor = UIColor(patternImage: UIImage(named: "checkered.png")!)
        }
        
        backgroundExample.layer.cornerRadius = 10
        backgroundExample.backgroundColor = color
        
        checkeredBackground.layer.cornerRadius = 10
        checkeredBackground.layer.shadowColor = UIColor.black.cgColor
        checkeredBackground.layer.shadowOpacity = 0.5
        checkeredBackground.layer.shadowOffset = CGSize.init(width: 0.7, height: 0.7)
        checkeredBackground.layer.shadowRadius = 1
        
        self.view.addConstraints(ConstraintsHelper.addConstraints(item: checkeredBackground, toItem: self.view, width: 150, height:150, xAlignment: "center", yAlignment: "top", xOffset: 0, yOffset: 100))
        checkeredBackground.addConstraints(ConstraintsHelper.addConstraints(item: backgroundExample, toItem: checkeredBackground, width: 150, height:150, xAlignment: "right", yAlignment: "center", xOffset: 0, yOffset: 0))
        
        // bottom anchor
        
        let parentHeight = self.view.frame.height
        bottomAnchor.backgroundColor = UIColor.sldsColorBackground(.backgroundRowHover)
        self.view.addSubview(bottomAnchor)
        self.view.addConstraints(ConstraintsHelper.addConstraints(item: bottomAnchor, toItem: self.view, width: self.view.frame.width, height: parentHeight - 300, xAlignment: "center", yAlignment: "bottom", xOffset: 0, yOffset: 0))
        
        self.view.backgroundColor = UIColor.white
        
        // code example
        
        textExample.numberOfLines = 0
        textExample.font = UIFont.sldsFont(.regular, with: .medium)
        textExample.textColor = UIColor.sldsColorText(.iconDefault)
        textExample.text = "import DesignSystem\n\n...\n\nUIColor\n.sldsColorBackground\n(" + alias + ")"
        self.view.addSubview(textExample)
        
        // copy button
        copyButton.setTitle("copy", for: .normal)
        copyButton.titleLabel?.font = UIFont.sldsFont(.regular, with: .medium)
        copyButton.setTitleColor(UIColor.sldsColorText(.brand), for: .normal)
        copyButton.layer.borderWidth = 1
        copyButton.layer.borderColor = UIColor.sldsColorBorder(.brand).cgColor
        copyButton.layer.cornerRadius = 10
        copyButton.contentEdgeInsets.top = 10
        copyButton.contentEdgeInsets.bottom = 10
        copyButton.contentEdgeInsets.left = 20
        copyButton.contentEdgeInsets.right = 20
        
        //copyButton.setImage(UIImage.sldsIconUtility(.copy, with: UIColor.sldsColorText(.brand), andSize: 40), for: .normal)
        self.view.addSubview(copyButton)
        self.view.addConstraints(ConstraintsHelper.stackV(item: copyButton, toItem: textExample, xAlignment: "center", direction: "down", xOffset: 0, yOffset: 50))
        
        
        
        self.view.addConstraints(ConstraintsHelper.addConstraints(item: textExample, toItem: bottomAnchor, xAlignment: "center", yAlignment: "top", xOffset: 0, yOffset: 50))
        
        
    }
}

