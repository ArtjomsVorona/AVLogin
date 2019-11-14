//
//  InfoViewController.swift
//  AVLogin
//
//  Created by Artjoms Vorona on 06/11/2019.
//  Copyright © 2019 Artjoms Vorona. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {
    
    
    @IBOutlet weak var appDescriptionLabel: UILabel!
    @IBOutlet weak var createdByLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appDescriptionLabel.text = "AVLogin app shows basic login functions for iOS app."

        createdByLabel.text = "This app is created as a homework project in \nRiga Coding School \nby \nArtjoms Vorona"
    }
    
    @IBAction func exitButtonTapped(_ sender: Any) {
        guard let loginVC = storyboard?.instantiateViewController(withIdentifier: "LoginSBID") as? ViewController else { return }
        self.present(loginVC, animated: true, completion: nil)
    }

}
