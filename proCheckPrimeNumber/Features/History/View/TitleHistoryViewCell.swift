//
//  TitleHistoryViewCell.swift
//  proCheckPrimeNumber
//
//  Created by Mac User on 2/9/2562 BE.
//  Copyright © 2562 Mac User. All rights reserved.
//

import Foundation
import UIKit

final class TitleHistoryViewCell: UICollectionViewCell {
    @IBOutlet weak var labelTItle: UILabel!
    @IBOutlet weak var viewStatus: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

extension TitleHistoryViewCell {
    func setupUI(toData: String, toResult: String) {
        labelTItle.text = "\(toData) is \(toResult)"
        if toResult == "Prime" {
            viewStatus.setViewCircleBGPrime()
        } else {
            viewStatus.setViewCircleBGNotPrime()
        }
    }
}
