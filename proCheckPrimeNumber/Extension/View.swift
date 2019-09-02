//
//  View.swift
//  proCheckPrimeNumber
//
//  Created by Mac User on 1/9/2562 BE.
//  Copyright © 2562 Mac User. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func setViewCircleBGPrime() {
        self.layer.cornerRadius = self.frame.width/2
        self.backgroundColor = UIColor.red
    }
    
    func setViewCircleBGNotPrime() {
        self.layer.cornerRadius = self.frame.width/2
        self.backgroundColor = UIColor.blue
    }
}
