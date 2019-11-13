//
//  Alert-Ext.swift
//  AVmanyApp
//
//  Created by Artjoms Vorona on 02/11/2019.
//  Copyright © 2019 Artjoms Vorona. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func basicAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
