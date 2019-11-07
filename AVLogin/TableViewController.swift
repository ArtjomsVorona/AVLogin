//
//  TableViewController.swift
//  AVLogin
//
//  Created by Artjoms Vorona on 06/11/2019.
//  Copyright © 2019 Artjoms Vorona. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var accountBalance = [2500.50, 1250.00, 400.00, 234.00]
    var accountCurrency = ["EUR", "EUR", "USD", "USD"]
    var bankAccounts = ["LV20 BANK 0001 0001 0001 1", "LV20 BANK 0001 0001 0001 2", "LV20 BANK 0001 0001 0001 3", "LV20 BANK 0001 0001 0001 4" ]
    var accountType = ["VISA", "MC", "Savings account", "VISA"]
    
    var username: String!
    
    @IBOutlet weak var welcomeMessageLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeMessageLabel.text = "Hello, \(username!)!"
    }
    @IBAction func exitButtonTapped(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return bankAccounts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AccountCell", for: indexPath) as! TableViewCell
        
        let index = indexPath.row
        cell.balanceLabel.text = String(format: "%0.2f", accountBalance[index]) + " \(accountCurrency[index])"
        cell.accountTypeLabel.text = accountType[index]
        cell.accountNumberLabel.text = bankAccounts[index]

        return cell
    }

}
