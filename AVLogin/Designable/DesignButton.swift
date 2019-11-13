//
//  DesignButton.swift
//  AVLogin
//
//  Created by Artjoms Vorona on 13/11/2019.
//  Copyright © 2019 Artjoms Vorona. All rights reserved.
//

import UIKit

@IBDesignable class DesignButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
    }
    
    func setupButton() {
        super.prepareForInterfaceBuilder()
        self.layer.cornerRadius = cornerRadius
    }
    
    @IBInspectable var cornerRadius: CGFloat = 5 {
        didSet {
            self.setupButton()
        }
    }
    
    
}
