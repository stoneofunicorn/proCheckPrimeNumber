//
//  sessionHistoryModel.swift
//  proCheckPrimeNumber
//
//  Created by Mac User on 1/9/2562 BE.
//  Copyright © 2562 Mac User. All rights reserved.
//

import Foundation
import ObjectMapper

struct sessionHistoryModel  {
    let dicData: String
    let dicResult: String
    
    init(_ json: [String:String]) {
        dicData = json["dicData"] ?? ""
        dicResult = json["dicResult"] ?? ""
    }
}
