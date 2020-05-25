//
//  UIViewComponentCollection.swift
//  Nonlinearity
//
//  Created by Юлия Плаксина on 22/05/2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

class SimpleCollectionCardsViewController: UIViewController {
    override var preferredStatusBarStyle: UIStatusBarStyle { .lightContent }
    
    var labelView = UILabel()
    var cardsAdapter = CardsCollectionViewAdapter()
    
    var additionalSpace = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .hex(rgb: 0x191919)
        additionalSpace.backgroundColor = .hex(rgb: 0x252525)
        
        initHeader()
        addCollection()
        
        [additionalSpace, labelView, cardsAdapter.collectionView!].forEach {
            view.addSubview($0!)
        }

        setConstraint()
    }
    
    func initHeader() {
        labelView.textAlignment = .left
        labelView.font = UIFont(name: "Arial-BoldMT", size: 23)
        labelView.textColor = .hex(rgb: 0xC35EB9)
        setTitle()
    }
    
    func addCollection() { }
    func setTitle() { }
    
    func setConstraint() {
        additionalSpace.translatesAutoresizingMaskIntoConstraints = false
        
        let screenWidth = UIScreen.main.bounds.size.width
        
        NSLayoutConstraint.activate([
             additionalSpace.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
             additionalSpace.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
             additionalSpace.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
             additionalSpace.heightAnchor.constraint(equalToConstant: screenWidth / 4.6),
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
             cardsAdapter.collectionView!.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
             cardsAdapter.collectionView!.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
             cardsAdapter.collectionView!.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

