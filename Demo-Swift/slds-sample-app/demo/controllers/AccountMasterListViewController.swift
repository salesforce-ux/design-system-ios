// Copyright (c) 2017, salesforce.com, inc. All rights reserved
// Licensed under BSD 3-Clause - see LICENSE.txt or git.io/sfdc-license

import UIKit

enum AccountType : String {
    case direct = "Customer - Direct"
    case channel = "Customer - Channel"
}

struct AccountObject {
    var name : String!
    var state : String!
    var phone : String!
    var type : AccountType!
    var owner : String!
    var industry : String!
    var number : String!
    var url : String!
}

class AccountMasterListViewController: UITableViewController {
    
    var superNavigationController : UINavigationController!
    
    let accounts = [
        AccountObject(name: "Burlington Textiles Corp of America",
                      state: "NC",
                      phone: "(336) 222-7000",
                      type: .direct,
                      owner: "Joe Green",
                      industry: "Apparel",
                      number: "CD656092",
                      url: "www.burlington.com"),
        AccountObject(name: "Dickenson Plc",
                      state: "KS",
                      phone: "(785) 241-6200",
                      type: .channel,
                      owner: "Joe Green",
                      industry: "Consulting",
                      number: "CC634267",
                      url: "dickenson-consulting.com"),
        AccountObject(name: "Edge Communications",
                      state: "TX",
                      phone: "(512) 757-6000",
                      type: .direct,
                      owner: "Joe Green",
                      industry: "Electronics",
                      number: "CD451796",
                      url: "www.edgecomm.com"),
        AccountObject(name: "Express Logistics and Transport",
                      state: "OR",
                      phone: "(503) 421-7800",
                      type: .channel,
                      owner: "Joe Green",
                      industry: "Transportation",
                      number: "CC947211",
                      url: "www.expresslandt.net"),
        AccountObject(name: "GenePoint",
                      state: "CA",
                      phone: "(650) 867-3450",
                      type: .channel,
                      owner: "Joe Green",
                      industry: "Biotechnology",
                      number: "CC978213",
                      url: "www.genepoint.com")
    ]
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.separatorInset = UIEdgeInsets.zero
        self.tableView.separatorColor = UIColor.sldsBorderColor(.colorBorderSeparatorAlt)
        
        self.tableView.register(AccountMasterCell.self, forCellReuseIdentifier: "cell")
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    func popController() {
        NotificationCenter.default.post(name: NSNotification.Name("returnToLibrary"), object: self)
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return accounts.count
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller  = AccountDetailViewController()
        controller.dataProvider = accounts[indexPath.item]

        self.superNavigationController.pushViewController(controller, animated: true)
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> AccountMasterCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AccountMasterCell
        cell.dataProvider = accounts[indexPath.item]
        
        return cell
    }
    
    //––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
}
