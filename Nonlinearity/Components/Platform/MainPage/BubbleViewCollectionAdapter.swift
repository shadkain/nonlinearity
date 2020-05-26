//
//  BubbleViewCollectionAdapter.swift
//  Nonlinearity
//
//  Created by Юлия Плаксина on 20/04/2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

class BubbleViewCollectionAdapter: UIViewComponent {
    private var bubbles = Bubbles()
    var collectionView: UICollectionView?
    private var flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    
    override func setup() {
        flowLayout.sectionInset = UIEdgeInsets(top: 20, left: 9, bottom: 5, right: 0)
        flowLayout.itemSize = CGSize(width: 85, height: 100)
        flowLayout.scrollDirection = .horizontal
        
        collectionView = UICollectionView(
            frame: frame,
            collectionViewLayout: flowLayout)
        
        
        collectionView!.backgroundColor = .hex(rgb: 0x252525)
        collectionView!.isScrollEnabled = true
        collectionView!.setContentOffset(CGPoint(x: 0,y: 0), animated: true)
        
        collectionView!.dataSource = self
        collectionView!.delegate = self
        
        collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellId")
        addSubview(collectionView!)
    }
}

extension BubbleViewCollectionAdapter: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bubbles.getElementsCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
        
        for subview in myCell.contentView.subviews {
            subview.removeFromSuperview()
        }
        
        let sv = bubbles.getBubbleViewByIndex(index: indexPath.item)
         sv.translatesAutoresizingMaskIntoConstraints = false
         myCell.contentView.addSubview(sv)

         NSLayoutConstraint.activate([
             sv.topAnchor.constraint(equalTo: myCell.contentView.topAnchor),
             sv.leadingAnchor.constraint(equalTo: myCell.contentView.leadingAnchor),
             sv.trailingAnchor.constraint(equalTo: myCell.contentView.trailingAnchor),
             sv.bottomAnchor.constraint(equalTo: myCell.contentView.bottomAnchor),
        ])

         return myCell
    }
}

extension BubbleViewCollectionAdapter: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       print("User tapped on bubble \(indexPath.item)")
    }
}
