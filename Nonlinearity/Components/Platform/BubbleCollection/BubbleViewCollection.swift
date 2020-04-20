//
//  BubbleViewCollection.swift
//  Nonlinearity
//
//  Created by Юлия Плаксина on 20/04/2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

class BubbleViewCollection: UIViewController {
    private var bubbles = Bubbles()
    var collectionView: UICollectionView?
    private var flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    
    override func viewDidLoad() {
        
        flowLayout.sectionInset = UIEdgeInsets(top: 20, left: 9, bottom: 5, right: 0)
        flowLayout.itemSize = CGSize(width: 85, height: 100)
        flowLayout.scrollDirection = .horizontal
        
        var collectionViewFrame = view.frame
        
        collectionViewFrame.size.height = 125
        collectionViewFrame.origin.y = 100
        collectionView = UICollectionView(
            frame: collectionViewFrame,
            collectionViewLayout: flowLayout)
        
        
        collectionView!.backgroundColor = .hex(rgb: 0x252525)
        collectionView!.isPagingEnabled = true
        collectionView!.isScrollEnabled = true
        collectionView!.setContentOffset(CGPoint(x: 0,y: 0), animated: true)
        
        collectionView!.dataSource = self
        //collectionView!.delegate = delegate
        
        collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellId")
        view.addSubview(collectionView!)
    }
    
    
}

extension BubbleViewCollection: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bubbles.GetElementsCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
        
        let sv = bubbles.GetBubbleViewByIndex(index: indexPath.item)
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

//extension BubbleViewCollection: UICollectionViewDelegate {
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//       print("User tapped on item \(indexPath.item)")
//    }
//}
