//
//  ViewController.swift
//  proCheckPrimeNumber
//
//  Created by Mac User on 1/9/2562 BE.
//  Copyright © 2562 Mac User. All rights reserved.
//

import UIKit

final class MainCheckPrimeNumberViewController: UIViewController {

    @IBOutlet weak var fieldInsert: UITextField!
    @IBOutlet weak var btnSubmit: UIButton!
    @IBOutlet weak var viewBG: UIView!
    @IBOutlet weak var labelResult: UILabel!
    
    let TAG: String = "MainCheckPrimeNumberViewController"
    var session: SessionManage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        hideKeyboard()
        session = SessionManage()
        print("\(session.getCountHistory())")
        for i in 0...session.getCountHistory() {
            print("\(session.getHistory(toNum: i).dicData)")
        }
        
    }
    @IBAction func actionSubmit(_ sender: Any) {
        onSubmit()
    }
    @IBAction func actionChangeText(_ sender: Any) {
        onCheckButton()
    }
}

extension MainCheckPrimeNumberViewController {
    private func setupUI() {
        fieldInsert.placeholder = "Insert your number"
        fieldInsert.layer.cornerRadius = 8
        btnSubmit.setTitle("Submit", for: .normal)
        btnSubmit.setBtnSubmitOff()
        labelResult.text = "Result"
    }
    
    private func onSubmit() {
        labelResult.textColor = UIColor.white
        countCheckPrime()
        
    }
    
    private func onCheckButton() {
        switch fieldInsert.text! {
        case "":
            btnSubmitNotAction()
        default:
            btnSubmitAction()
        }
    }
    
    private func countCheckPrime() {
        let txtInsert: String = "\(fieldInsert.text!)"
        let changeNum: Int = Int(txtInsert)!
        print(TAG+": changeNum: \(changeNum)")
        
        for i in 2..<changeNum {
            
            let sum: Float = Float(changeNum)/Float(i)
            let decimal = sum.truncatingRemainder(dividingBy: 1)
            print(TAG+": number \(i)sum: \(sum) || b: \(decimal)")
            
            if decimal == 0.0 {
                changeNotPrime()
                break
                
            } else {
                if i == changeNum-1 {
                    changePrime()
                }
            }
        }
    }
    
    private func changePrime() {
        labelResult.text = "Prime"
        viewBG.setViewCircleBGPrime()
        session.saveHistory(toData: fieldInsert.text!, toResult: "Prime")
    }
    
    private func changeNotPrime() {
        labelResult.text = "Not Prime"
        viewBG.setViewCircleBGNotPrime()
        session.saveHistory(toData: fieldInsert.text!, toResult: "Not Prime")
    }
    
    private func btnSubmitAction() {
        btnSubmit.setBtnSubMitON()
    }
    
    private func btnSubmitNotAction() {
        btnSubmit.setBtnSubmitOff()
    }
    
    private func hideKeyboard() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

