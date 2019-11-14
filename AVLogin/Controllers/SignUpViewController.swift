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
    
    var ref: DatabaseReference!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference(withPath: "appUsers")
    }
    
    @IBAction func signUpButtonTapped() {
        guard let email = emailTextField.text, let password = passwordTextField.text else {
            basicAlert(title: "Email or password is not correct", message: "")
            return
        }
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            guard let createdUser = authResult?.user, error == nil else {
                self.basicAlert(title: "Sign up error", message: error!.localizedDescription)
                return
            }
            let createdUserRef = self.ref.child(createdUser.uid)
            createdUserRef.setValue(["email": createdUser.email])
            print("\(createdUser.email!) was created")
            self.goToMainVC()
        }
    }
    
    func goToMainVC() {
        guard let barViewController = storyboard?.instantiateViewController(withIdentifier: "TabBarSBID") as? UITabBarController else { return }
        self.present(barViewController, animated: true, completion: nil)
        self.view.endEditing(true)
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
            signUpButtonTapped()
        }
        return true
    }
    
}

