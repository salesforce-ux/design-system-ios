//
//  IconViewController.swift
//  slds-sample-app
//
//  Created by John Earle on 12/1/16.
//  Copyright © 2016 John Earle. All rights reserved.
//

import UIKit

class AccountContainerViewController: UIViewController {
    
    var header = UIView()
    var headerIcon = UIImageView()
    var headerTitle = UILabel()
    var headerSubText = UILabel()
    var headerDownArrow = UIImageView()
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func viewDidLoad() {
        super.viewDidLoad()
        header = UIView()
        self.view.addSubview(header)
        self.view.addConstraints(ConstraintsHelper.addConstraints(item: header, toItem: self.view, width: self.view.frame.width, height: 80, xAlignment: .left, yAlignment: .center, xOffset: 0, yOffset: 0))
        header.backgroundColor = UIColor.sldsColorBackground(.background)
        
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
}
