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
        
        self.view.constrainChild(header,
                                 xAlignment: .center,
                                 yAlignment: .top,
                                 width: self.view.frame.width,
                                 height: 80,
                                 yOffset: 64)
        
        
        headerIcon = UIImageView(image: UIImage.sldsIconStandard(.account, withSize: SLDSSquareIconMedium))
        header.addSubview(headerIcon)
        
        header.constrainChild(headerIcon,
                              xAlignment: .left,
                              yAlignment: .top,
                              xOffset: 10,
                              yOffset: 10)
        
        headerTitle = UILabel()
        headerTitle.text = "My Accounts"
        headerTitle.font = UIFont.sldsFont(.regular, with: .large)
        headerSubText.textColor = UIColor.sldsColorText(.default)
        header.addSubview(headerTitle)
        
        headerTitle.constrainRightOf(headerIcon,
                                     yAlignment: .top,
                                     xOffset: 15)
        
        headerDownArrow = UIImageView(image: UIImage.sldsIconUtility(.chevrondown, with: UIColor.sldsColorText(.default), andSize: SLDSSquareIconUtilitySmall))
        header.addSubview(headerDownArrow)
        
        headerDownArrow.constrainRightOf(headerTitle,
                                         yAlignment: .center,
                                         xOffset: 15,
                                         yOffset: 2)
        
        headerSubText = UILabel()
        headerSubText.text = "5 items, sorted by Account Name"
        headerSubText.font = UIFont.sldsFont(.regular, with: .small)
        headerSubText.textColor = UIColor.sldsColorText(.default)
        header.addSubview(headerSubText)
        
        headerSubText.constrainBelow(headerTitle,
                                     xAlignment: .left,
                                     yOffset: 2)
        
        self.view.addSubview(tableViewController.tableView)
        
        tableViewController.tableView.constrainBelow(header,
                                                     xAlignment: .left,
                                                     width: self.view.frame.width,
                                                     height: self.view.frame.height - 212)
        
//        tabBar = UITabBar()
//        tabBar.backgroundColor = UIColor.sldsColorBackground(.backgroundAlt)
//        self.view.addSubview(tabBar)
//        self.view.constrain(tabBar,
//                            inside: self.view,
//                            xAlignment: .center,
//                            yAlignment: .bottom,
//                            width: self.view.frame.width,
//                            height: 60)
        
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
