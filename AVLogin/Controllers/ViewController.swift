//
//  ViewController.swift
//  AVLogin
//
//  Created by Artjoms Vorona on 06/11/2019.
//  Copyright © 2019 Artjoms Vorona. All rights reserved.
//

import Firebase
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var loginImageView: UIImageView!
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setOutlets()
        setLoginImageBlur()
    }
    
    @IBAction func forgotPasswordButtonTapped(_ sender: UIButton) {
        basicAlert(title: "For test you can use:", message: "\nUsername: \(username) \n Password: \(password)")
        
    }
    @IBAction func signUPButtonsTapped(_ sender: UIButton) {
        let signUpVC = storyboard?.instantiateViewController(withIdentifier: "SingUpSBID") as! SignUpViewController
        self.present(signUpVC, animated: true, completion: nil)
    }
    
    
    @IBAction func loginButtonTapped() {
        guard let email = userNameTextField.text, let password = passwordTextField.text else {
            basicAlert(title: "Email/password error!", message: "Please enter correct loging credentials.")
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            if let authResult = authResult, error == nil {
                self.goToMainVC()
            } else {
                self.basicAlert(title: "Authentication error!", message: error!.localizedDescription)
            }
            
        }
        clearTextFields()
    }
    
    
    func setOutlets() {
        userNameTextField.borderStyle = .roundedRect
        passwordTextField.borderStyle = .roundedRect
        loginButton.layer.cornerRadius = 5
    }
    
    func setLoginImageBlur() {
        let blur = UIBlurEffect(style: .systemMaterialDark)
        let blurView = UIVisualEffectView(effect: blur)
        blurView.alpha = 0.4
        blurView.frame = loginImageView.bounds
        loginImageView.addSubview(blurView)
    }
    
    func clearTextFields() {
        userNameTextField.text?.removeAll()
        passwordTextField.text?.removeAll()
    }
    
    
    // MARK: - Navigation
    
    func goToMainVC() {
        guard let barViewController = storyboard?.instantiateViewController(withIdentifier: "TabBarSBID") as? UITabBarController else { return }
        self.present(barViewController, animated: true, completion: nil)
        self.view.endEditing(true)
    }
    

    
}//End class

//MARK: Extensions
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField {
            textField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
        } else {
            loginButtonTapped()
        }
        return true
    }
}


