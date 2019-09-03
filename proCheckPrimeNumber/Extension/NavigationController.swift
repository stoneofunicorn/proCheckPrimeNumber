//
//  NavigationController.swift
//  proCheckPrimeNumber
//
//  Created by Mac User on 2/9/2562 BE.
//  Copyright © 2562 Mac User. All rights reserved.
//

import Foundation
import UIKit

final class Navigation: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

extension Navigation {
    private func setupUI() {
        navigationBar.barTintColor = UIColor.orange
        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationBar.tintColor = UIColor.white
    }
}
