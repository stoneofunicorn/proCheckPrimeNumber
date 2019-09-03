//
//  HistoryViewController.swift
//  proCheckPrimeNumber
//
//  Created by Mac User on 2/9/2562 BE.
//  Copyright © 2562 Mac User. All rights reserved.
//

import Foundation
import UIKit

final class HistoryViewController: UIViewController {
    
    private enum Constants {
        static let identifierhistory = "idenHistorycell"
        static let classhistory = "titlehistorycell"
    }
    
    @IBOutlet weak var coll: UICollectionView!
    var session: SessionManage!
    var arrData: [String] = []
    var arrSult: [String] = []
    var size: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.topItem?.title = "History"
    }
    
    @IBAction func actionBack(_ sender: Any) {
        onback()
    }
}

extension HistoryViewController {
    private func setupUI() {
        session = SessionManage()
        size = session.getCountHistory()
        setData()
        
    }
    
    private func setData() {
        let ifSize = size-10
        for i in (0..<size).reversed() {
//             print("\(session.getHistory(toNum: i).dicData)")
            arrData.append(session.getHistory(toNum: i).dicData)
            arrSult.append(session.getHistory(toNum: i).dicResult)
            if ifSize == i {
                arrData.append(session.getHistory(toNum: i).dicData)
                arrSult.append(session.getHistory(toNum: i).dicResult)
                break
            }
        }
        setCollectionView()
    }
    
    private func setCollectionView() {
        let nib = UINib(nibName: Constants.classhistory, bundle: nil)
        coll.register(nib, forCellWithReuseIdentifier: Constants.identifierhistory)
        coll.delegate = self
        coll.dataSource = self
    }
    
    private func onback() {
        view.pageFromLeft()
        dismiss(animated: false)
    }
}

extension HistoryViewController: UICollectionViewDataSource,UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if size <= 10 {
            return size
        } else {
            return 10
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.identifierhistory, for: indexPath) as! TitleHistoryViewCell
        
        cell.setupUI(toData: arrData[indexPath.row], toResult: arrSult[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 50)
    }
}


