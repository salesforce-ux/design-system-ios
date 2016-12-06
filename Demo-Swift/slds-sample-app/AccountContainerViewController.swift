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
    
    var tableViewController = AccountListViewController()
    
    var tabBar = UITabBar()
    
    var tabBarItems = Array<UITabBarItem>()
    
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        header = UIView()

        self.view.addSubview(header)
        header.backgroundColor = UIColor.sldsColorBackground(.background)
        self.view.addSubview(header)
        self.view.constrain(header,
                       inside: self.view,
                       xAlignment: .center,
                       yAlignment: .top,
                       width: self.view.frame.width,
                       height: 80,
                       yOffset: 64)
        
        let hr = UIView()
        hr.backgroundColor = UIColor.sldsColorBorder(.input)
        self.view.addSubview(hr)
        self.view.constrain(hr,
                            inside: header,
                            xAlignment: .center,
                            yAlignment: .bottom,
                            width: self.view.frame.width,
                            height: 1)
        
        
        headerIcon = UIImageView(image: UIImage.sldsIconStandard(.account, withSize: SLDSSquareIconMedium))
        self.view.addSubview(headerIcon)
        self.view.constrain(headerIcon,
                            inside: header,
                            xAlignment: .left,
                            yAlignment: .top,
                            xOffset: 10,
                            yOffset: 10)
        
        headerTitle = UILabel()
        headerTitle.text = "My Accounts"
        headerTitle.font = UIFont.sldsFont(.regular, with: .large)
        headerSubText.textColor = UIColor.sldsColorText(.default)
        self.view.addSubview(headerTitle)
        self.view.constrain(headerTitle,
                       horizontallyTo: headerIcon,
                       yAlignment: .top,
                       direction: .right,
                       xOffset: 15)
        
        headerDownArrow = UIImageView(image: UIImage.sldsIconUtility(.chevrondown, with: UIColor.sldsColorText(.default), andSize: SLDSSquareIconUtilitySmall))
        self.view.addSubview(headerDownArrow)
        self.view.constrain(headerDownArrow,
                       horizontallyTo: headerTitle,
                       yAlignment: .center,
                       direction: .right,
                       xOffset: 15,
                       yOffset: 2)
        
        headerSubText = UILabel()
        headerSubText.text = "5 items, sorted by Account Name"
        headerSubText.font = UIFont.sldsFont(.regular, with: .small)
        headerSubText.textColor = UIColor.sldsColorText(.default)
        self.view.addSubview(headerSubText)
        self.view.constrain(headerSubText,
                            verticallyTo: headerTitle,
                            xAlignment: .left,
                            direction: .down,
                            yOffset: 2)
        
        self.view.addSubview(tableViewController.tableView)
        self.view.constrain(tableViewController.tableView,
                            verticallyTo: header,
                            xAlignment: .left,
                            direction: .down,
                            width: self.view.frame.width,
                            height: self.view.frame.height - 212)
        
        tabBar = UITabBar()
        tabBar.backgroundColor = UIColor.sldsColorBackground(.backgroundAlt)
        self.view.addSubview(tabBar)
        self.view.constrain(tabBar,
                            inside: self.view,
                            xAlignment: .center,
                            yAlignment: .bottom,
                            width: self.view.frame.width,
                            height: 60)
        
//        let filterButton = UITabBarItem()
//        filterButton.image = UIImage.sldsIconAction(.filter, withSize: SLDSSquareIconMedium)
//        filterButton.title = "Filter"
//        filterButton.roundIcon()
//        
//        let sortButton = UITabBarItem()
//        sortButton.image = UIImage.sldsIconAction(.sort, withSize: SLDSSquareIconMedium)
//        sortButton.title = "Sort"
//        sortButton.roundIcon()
//        
//        let newButton = UITabBarItem()
//        newButton.image = UIImage.sldsIconAction(.new, withSize: SLDSSquareIconMedium)
//        newButton.title = "New"
//        newButton.roundIcon()
        
//        tabBarItems = [filterButton, sortButton, newButton]
        
        tabBar.setItems(tabBarItems, animated: true)
        
        
        
        self.view.backgroundColor = UIColor.white
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
}
