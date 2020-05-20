//
//  DownloadsPageView.swift
//  Nonlinearity
//
//  Created by Юлия Плаксина on 20/05/2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

class DownloadsPageView: UIViewController {
    override var preferredStatusBarStyle: UIStatusBarStyle { .lightContent }
    
    private var labelView = UILabel()
    
    var cardsAdapter = CollectionCardViewAdapter()
    var additionalSpace = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .hex(rgb: 0x191919)
        
        additionalSpace.backgroundColor = .hex(rgb: 0x252525)
        initHeader()
        
        [additionalSpace, labelView, cardsAdapter.collectionView!].forEach {
            view.addSubview($0!)
        }

        setConstraint()
        
    }
    
    private func initHeader() {
        labelView.textAlignment = .left
        labelView.text = "Загрузки"
        labelView.font = UIFont(name: "Arial-BoldMT", size: 23)
        labelView.textColor = .hex(rgb: 0xC35EB9)
        //labelView.backgroundColor = .hex(rgb: 0x191919)
    }
    
    func setConstraint() {
        additionalSpace.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
             additionalSpace.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
             additionalSpace.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
             additionalSpace.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
             additionalSpace.heightAnchor.constraint(equalToConstant: 90),
        ])
        
        labelView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelView.topAnchor.constraint(equalTo: additionalSpace.bottomAnchor),
            labelView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            labelView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            labelView.heightAnchor.constraint(equalToConstant: 50),
        ])
        
        cardsAdapter.collectionView!.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
             cardsAdapter.collectionView!.topAnchor.constraint(equalTo: labelView.bottomAnchor),
             cardsAdapter.collectionView!.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
             cardsAdapter.collectionView!.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
             cardsAdapter.collectionView!.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
