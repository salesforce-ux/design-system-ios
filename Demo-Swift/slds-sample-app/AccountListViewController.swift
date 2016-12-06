//
//  UserListViewController.swift
//  slds-sample-app
//
//  Created by Joe Andolina on 11/21/16.
//  Copyright © 2016 John Earle. All rights reserved.
//

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
}

class AccountListViewController: UITableViewController {
    
    let accounts = [
        AccountObject(name: "Hello", state: "CA", phone: "415 323-2323", type: .channel, owner: "Joe Green")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "SLDS Sample App"
        self.tableView.register(AccountCell.self, forCellReuseIdentifier: "cell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

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
        let controller  = FontViewController()
        controller.dataProvider = indexPath
        self.navigationController?.pushViewController(controller, animated: true)
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> AccountCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AccountCell
        cell.dataProvider = accounts[indexPath.item]
        

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
