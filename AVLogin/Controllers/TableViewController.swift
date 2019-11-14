//
//  TableViewController.swift
//  AVLogin
//
//  Created by Artjoms Vorona on 06/11/2019.
//  Copyright © 2019 Artjoms Vorona. All rights reserved.
//

import Firebase
import UIKit

class TableViewController: UITableViewController {
    
    @IBOutlet var accountsTableView: UITableView!
    
    var appUser: AppUser!
    var ref: DatabaseReference!
    var accounts = [Account]()
    
    @IBOutlet weak var welcomeMessageLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let currentUser = Auth.auth().currentUser else { return}
        appUser = AppUser(user: currentUser)
        ref = Database.database().reference(withPath: "appUsers").child(String(appUser.uid)).child("account")
        
        welcomeMessageLabel.text = "Hello, \(appUser.email)"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        ref.observe(.value) { (snapshot) in
            var newAccounts = [Account]()
            for item in snapshot.children {
                let account = Account(snapshot: item as! DataSnapshot)
                newAccounts.append(account)
            }
            self.accounts = newAccounts
            self.accountsTableView.reloadData()
        }
    }
    
    @IBAction func addNewAccountTapped(_ sender: Any) {
        print("new account")
        let alert = UIAlertController(title: "Add new account", message: "", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Account number"
        }
        alert.addAction(UIAlertAction(title: "Save", style: .default) { (_) in
            guard let textField = alert.textFields?.first, textField.text != "" else { return }
        
            let newAccount = Account(userId: self.appUser.uid, number: textField.text!, type: "VISA", amount: 200.00)
            let accountRef = self.ref.child(newAccount.account)
            accountRef.setValue(newAccount.convertToDict())
        })
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func exitButtonTapped(_ sender: UIBarButtonItem) {
        guard let loginVC = storyboard?.instantiateViewController(withIdentifier: "LoginSBID") as? ViewController else { return }
        self.present(loginVC, animated: true, completion: nil)
    }
    

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accounts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AccountCell", for: indexPath) as! TableViewCell
        
        let index = indexPath.row
        cell.balanceLabel.text = String(format: "%0.2f", accounts[index].amount)
        cell.accountTypeLabel.text = accounts[index].type
        cell.accountNumberLabel.text = accounts[index].account

        return cell
    }

}
