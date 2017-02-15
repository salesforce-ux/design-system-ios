// Copyright (c) 2015-present, salesforce.com, inc. All rights reserved
// Licensed under BSD 3-Clause - see LICENSE.txt or git.io/sfdc-license

import UIKit

//––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

class SearchController: UIViewController, UISearchBarDelegate {
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    var searchHeader = UISearchBar()
    var filterString : String = ""
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        styleSearch()
    }
    
    // MARK: Styling methods
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func styleSearch() {
        searchHeader.delegate = self
        searchHeader.placeholder = "Search"
        searchHeader.keyboardType = .alphabet
        searchHeader.returnKeyType = .done
        searchHeader.autocapitalizationType = .none
        searchHeader.autocorrectionType = .no
        searchHeader.tintColor = UIColor.sldsBackgroundColor(.colorBrand)
        searchHeader.barTintColor = UIColor.sldsBackgroundColor(.colorBackground)
        searchHeader.backgroundColor = UIColor.white
        self.view.addSubview(searchHeader)
        self.view.constrainChild(searchHeader,
                                 xAlignment: .center,
                                 yAlignment: .top,
                                 width: self.view.frame.width)
    }
    
    // MARK: UISearchBarDelegate
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.searchHeader.setShowsCancelButton(true, animated: true)
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.filterString = searchText.lowercased()
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        self.filterString = ""
        self.view.endEditing(true)
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        self.searchHeader.setShowsCancelButton(false, animated: true)
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
}
