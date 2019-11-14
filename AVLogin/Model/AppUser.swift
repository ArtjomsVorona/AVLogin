//
//  AppUser.swift
//  AVLogin
//
//  Created by Artjoms Vorona on 14/11/2019.
//  Copyright © 2019 Artjoms Vorona. All rights reserved.
//

import Firebase
import UIKit

class AppUser {
    var email: String
    var uid: String
    
    init(user: User) {
        self.email = user.email!
        self.uid = user.uid
    }
}
