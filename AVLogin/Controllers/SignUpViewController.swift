//
//  SignUpViewController.swift
//  AVLogin
//
//  Created by Artjoms Vorona on 13/11/2019.
//  Copyright © 2019 Artjoms Vorona. All rights reserved.
//

import Firebase
import UIKit

class SignUpViewController: UIViewController {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signUpButtonTapped() {
        guard let email = emailTextField.text, let password = passwordTextField.text else {
            basicAlert(title: "Email or password is not correct", message: "")
            return
        }
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            guard let user = authResult?.user, error == nil else {
                self.basicAlert(title: "Sign up error", message: error!.localizedDescription)
                return
            }
            print("\(user.email!) was created")
            
        }
        
    }
    
}//end class

//MARK: Extension

extension SignUpViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField {
            textField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
            
        }
        return true
    }
    
}

