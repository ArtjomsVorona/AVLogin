//
//  Account.swift
//  AVLogin
//
//  Created by Artjoms Vorona on 14/11/2019.
//  Copyright © 2019 Artjoms Vorona. All rights reserved.
//

import Firebase

struct Account {
    var userId: String
    var account: String
    var type: String
    var amount: Double
    var ref: DatabaseReference?
    
    init(userId: String, number: String, type: String, amount: Double) {
        self.userId = userId
        self.account = number
        self.type = type
        self.amount = amount
        self.ref = nil
    }
    
    init(snapshot: DataSnapshot) {
        let snapshotValue = snapshot.value as! [String: Any]
        userId = snapshotValue["userId"] as! String
        account = snapshotValue["account"] as! String
        type = snapshotValue["type"] as! String
        amount = snapshotValue["amount"] as! Double
        
        ref = snapshot.ref
    }
    
    func convertToDict() -> Any {
        return ["userId": userId, "account": account, "type": type, "amount": amount]
    }
}
