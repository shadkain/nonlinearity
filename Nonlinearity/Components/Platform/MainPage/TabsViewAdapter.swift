//
//  TabsViewAdapter.swift
//  Nonlinearity
//
//  Created by Юлия Плаксина on 27/04/2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

class TabsViewAdapter: UIViewComponent {
    private var tabs = Tabs()
    
    private var table: TableCardViewAdapter?
    
    var collectionView: UICollectionView?
    private var flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    
    override func setup() {
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let width = UIScreen.main.bounds.width/4 - 5
        flowLayout.itemSize = CGSize(width: width, height: 30)
        flowLayout.scrollDirection = .horizontal
        
        collectionView = UICollectionView(
            frame: frame,
            collectionViewLayout: flowLayout)
    
        
        collectionView!.backgroundColor = .hex(rgb: 0x252525)
        collectionView!.dataSource = self
        collectionView!.delegate = self
        
        collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "tabsViewCellId")
        addSubview(collectionView!)
    }
}

extension TabsViewAdapter {
    func setTable(newTable: TableCardViewAdapter) {
        table = newTable
    }
}

extension TabsViewAdapter: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tabs.getElementsCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "tabsViewCellId", for: indexPath)
        
        let tv = tabs.getTabViewByIndex(index: indexPath.item)
        
        if indexPath.item == 0 {
            tabs.activateViewByIndex(index: indexPath.item)
        }
        
        tv.translatesAutoresizingMaskIntoConstraints = false
        myCell.contentView.addSubview(tv)

        NSLayoutConstraint.activate([
            tv.topAnchor.constraint(equalTo: myCell.contentView.topAnchor),
            tv.leadingAnchor.constraint(equalTo: myCell.contentView.leadingAnchor),
            tv.trailingAnchor.constraint(equalTo: myCell.contentView.trailingAnchor),
            tv.bottomAnchor.constraint(equalTo: myCell.contentView.bottomAnchor),
        ])

        return myCell
    }
}

extension TabsViewAdapter: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        tabs.activateViewByIndex(index: indexPath.item)
        table!.currentTypeOfTab = TypeOfTab(rawValue: indexPath.item) ?? .main
        table!.tableView!.reloadData()
        print("User tapped on tab \(indexPath.item)")
    }
}
