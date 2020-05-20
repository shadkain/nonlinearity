//
//  MainPageView.swift
//  Nonlinearity
//
//  Created by Юлия Плаксина on 20/04/2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

class MainPageView: UIViewController {
    override var preferredStatusBarStyle: UIStatusBarStyle { .lightContent }
    
    var bubbleAdapter = BubbleViewCollectionAdapter()
    var tableAdapter = TableCardViewAdapter()
    var tabAdapter = TabsViewAdapter()
    var additionalSpace = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .hex(rgb: 0x191919)
        
        //tabAdapter.setTable(newTable: tableAdapter)
        
        additionalSpace.backgroundColor = .hex(rgb: 0x252525)
        
        view.addSubview(additionalSpace)
        //view.addSubview(tabAdapter.collectionView!)
        view.addSubview(bubbleAdapter.collectionView!)
        view.addSubview(tableAdapter.tableView!)
        setConstraint()
        
    }
    
    func setConstraint() {
        additionalSpace.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
             additionalSpace.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
             additionalSpace.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
             additionalSpace.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
             additionalSpace.heightAnchor.constraint(equalToConstant: 2),
        ])
        
//        tabAdapter.collectionView!.translatesAutoresizingMaskIntoConstraints = false
//        
//        NSLayoutConstraint.activate([
//             tabAdapter.collectionView!.topAnchor.constraint(equalTo: additionalSpace.bottomAnchor),
//             tabAdapter.collectionView!.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
//             tabAdapter.collectionView!.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
//             tabAdapter.collectionView!.heightAnchor.constraint(equalToConstant: 30),
//        ])
        
        bubbleAdapter.collectionView!.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
             bubbleAdapter.collectionView!.topAnchor.constraint(equalTo: additionalSpace.bottomAnchor),
             bubbleAdapter.collectionView!.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
             bubbleAdapter.collectionView!.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
             bubbleAdapter.collectionView!.heightAnchor.constraint(equalToConstant: 125),
        ])
        
        tableAdapter.tableView!.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableAdapter.tableView!.topAnchor.constraint(equalTo: bubbleAdapter.collectionView!.bottomAnchor),
             tableAdapter.tableView!.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
             tableAdapter.tableView!.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
             tableAdapter.tableView!.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
