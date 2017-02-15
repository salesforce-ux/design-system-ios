// Copyright (c) 2015-present, salesforce.com, inc. All rights reserved
// Licensed under BSD 3-Clause - see LICENSE.txt or git.io/sfdc-license

import UIKit

class AccountDetailListViewController: UITableViewController {
    
    var superNavigationController : UINavigationController!
    
    var cellValues = Array<(label : String, value : String)>()
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    var dataProvider : AccountObject? {
        didSet {
            cellValues.append((label: "Account Owner",
                               value: (self.dataProvider?.owner)!))
            cellValues.append((label: "Account Name",
                               value: (self.dataProvider?.name)!))
            cellValues.append((label: "Account Number",
                               value: (self.dataProvider?.number)!))
            cellValues.append((label: "Type",
                               value: (self.dataProvider?.type)!.rawValue))
            cellValues.append((label: "Industry",
                               value: (self.dataProvider?.industry)!))
            cellValues.append((label: "Website",
                               value: (self.dataProvider?.url)!))
            cellValues.append((label: "Phone",
                               value: (self.dataProvider?.phone)!))
        }
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.separatorInset = UIEdgeInsets.zero
        self.tableView.separatorColor = UIColor.sldsBorderColor(.colorBorderSeparatorAlt)
        
        self.tableView.register(AccountDetailCell.self, forCellReuseIdentifier: "cell")
    }
    
    // MARK: - Table view data source
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellValues.count
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> AccountDetailCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AccountDetailCell
        cell.dataProvider = cellValues[indexPath.item]
        
        return cell
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
}
