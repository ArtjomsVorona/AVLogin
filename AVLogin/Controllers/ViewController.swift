//
//  ViewController.swift
//  AVLogin
//
//  Created by Artjoms Vorona on 06/11/2019.
//  Copyright © 2019 Artjoms Vorona. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let username = "rcs"
    let password = "swift"
    
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
        guard userNameTextField.text == username else {
            basicAlert(title: "Wrong username", message: "Please enter correct username")
            return
        }
        guard passwordTextField.text == password else {
            basicAlert(title: "Wrong password", message: "Please enter correct password")
            return
        }
        performSegue(withIdentifier: "Login", sender: nil)
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

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "Login" else { return }
        if let barViewController = segue.destination as? UITabBarController {
            let nav = barViewController.viewControllers?[0] as! UINavigationController
            let destinationVC = nav.viewControllers[0] as! TableViewController
            destinationVC.username = username.capitalized
            self.view.endEditing(true)
        }
    }
}

extension ViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
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

