//
//  SessionManager.swift
//  proCheckPrimeNumber
//
//  Created by Mac User on 1/9/2562 BE.
//  Copyright © 2562 Mac User. All rights reserved.
//

import Foundation

final class SessionManage {
    
    // Count
    
    private func saveCountHistory() {
        if getCountHistory() == 0 {
            UserDefaults.standard.set(1,forKey: "countHistory")
        } else {
            UserDefaults.standard.set(getCountHistory()+1,forKey: "countHistory")
        }
        
    }
    
    func getCountHistory() -> Int {
        let count = UserDefaults.standard.integer(forKey: "countHistory")
        return count
    }
    
    // History
    
    func saveHistory(toData: String, toResult: String) {
        let num: Int = getCountHistory()
        if num == 0 {
            let save: [String:String] = ["dicData": toData, "dicResult": toResult]
            UserDefaults.standard.set(save, forKey: "saveHistory0")
            saveCountHistory()
        } else {
            print("else 0")
            let count: Int = getCountHistory()
            for i in 0..<count {
                if getHistory(toNum: i).dicData == toData {
                    print("Not Save")
                    break
                } else {
                    if i == count-1 {
                        print("Save")
                        let key: String = "saveHistory\(i)"
                        let save: [String:String] = ["dicData": toData, "dicResult": toResult]
                        UserDefaults.standard.set(save, forKey: key)
                        saveCountHistory()
                    }
                }
            }
        }
    }
    
    func getHistory(toNum: Int) -> sessionHistoryModel {
        
        return sessionHistoryModel((UserDefaults.standard.dictionary(forKey: "saveHistory\(toNum)") as? [String:String]) ?? [:])
    }
}
