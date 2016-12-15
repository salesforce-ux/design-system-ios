/*
 Copyright (c) 2016, salesforce.com, inc. All rights reserved.
 Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
 Neither the name of salesforce.com, inc. nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

import UIKit

//––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

class ColorListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    var searchHeader = UISearchBar()
    var colors : Array<ColorObject> = Array<ColorObject>()
    var filteredColors : Array<ColorObject> = Array<ColorObject>()
    var colorTableView : UITableView!
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override var title: String? {
        didSet {
            super.title = self.title
            switch self.title! {
                case ColorObjectType.background.rawValue :
                    self.colors = ApplicationModel.sharedInstance.backgroundColors
                case ColorObjectType.border.rawValue :
                    self.colors = ApplicationModel.sharedInstance.borderColors
                case ColorObjectType.text.rawValue :
                    self.colors = ApplicationModel.sharedInstance.textColors
                default : break
            }
            self.filterString = ""
        }
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    var filterString : String = "" {
        didSet {
            self.filteredColors = self.colors.filter {
                if self.filterString == "" {
                    return true
                } else {
                    return ($0 as ColorObject).name.lowercased().range(of: filterString) != nil
                }
            }
            
            DispatchQueue.main.async {
                self.colorTableView.reloadData()
            }
        }
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        styleSearch()
        styleTableView()
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
        searchHeader.tintColor = UIColor.sldsColorBackground(.brand)
        searchHeader.barTintColor = UIColor.sldsColorBackground(.background)
        self.view.addSubview(searchHeader)
        self.view.constrainChild(searchHeader,
                                 xAlignment: .center,
                                 yAlignment: .top,
                                 width: self.view.frame.width,
                                 yOffset: 64)
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func styleTableView() {
        
        colorTableView = UITableView(frame: CGRect(x: 0, y: 108, width: self.view.frame.width, height: self.view.frame.height - 108))
        colorTableView.delegate = self
        colorTableView.dataSource = self
        colorTableView.register(ColorCell.self, forCellReuseIdentifier: "Cell")
        colorTableView.backgroundColor = UIColor.white
        self.view.addSubview(colorTableView)
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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ColorCell
        cell.dataProvider = filteredColors[indexPath.item]
        return cell
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = ColorViewController()
        controller.dataProvider = self.filteredColors[indexPath.row]
        self.navigationController?.show(controller, sender: self)
    }
}
