//
//  Button.swift
//  proCheckPrimeNumber
//
//  Created by Mac User on 1/9/2562 BE.
//  Copyright © 2562 Mac User. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    func setBtnSubmitOff() {
        self.layer.cornerRadius = 8
        self.backgroundColor = UIColor.lightGray
        self.setTitleColor(UIColor.gray, for: .normal)
        self.isEnabled = false
    }
    
    func setBtnSubMitON() {
        self.layer.cornerRadius = 8
        self.backgroundColor = UIColor.gray
        self.setTitleColor(UIColor.black, for: .normal)
        self.isEnabled = true
    }
    
    func setBtnHistory() {
        self.layer.cornerRadius = 8
        self.backgroundColor = UIColor.orange
        self.setTitleColor(UIColor.white, for: .normal)
    }
}
