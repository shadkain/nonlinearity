//
//  TableCardViewCell.swift
//  Nonlinearity
//
//  Created by Юлия Плаксина on 19/04/2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

class TableCardViewCell: UITableViewCell {
    private var labelView = UILabel()
    var storyCard: StoryCard?
    private var collectionView: UICollectionView?
    
    private var flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    
    func initCell () {
        contentView.backgroundColor = .hex(rgb: 0x191919)
        
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 114, height: 190)
        flowLayout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 0)
        
        var collectionViewBounds = self.bounds
        collectionViewBounds.size.height = 220
        collectionViewBounds.origin.y = 30
        collectionView = UICollectionView(
            frame: collectionViewBounds,
            collectionViewLayout: flowLayout)

        collectionView!.backgroundColor = .hex(rgb: 0x191919)
        collectionView!.showsHorizontalScrollIndicator = false
        collectionView!.dataSource = self
        collectionView!.delegate = self

        // Setting the collection view scrolling behaviour
        collectionView!.isPagingEnabled = true
        collectionView!.isScrollEnabled = true
        collectionView!.setContentOffset(CGPoint(x: 0,y: 0), animated: true)

        collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellWithCollectionView")
        
        initHeader()
        
        [labelView, collectionView].forEach {
            contentView.addSubview($0!) }
        }
    
    private func initHeader() {
        labelView.frame = CGRect(x: 20, y: 0, width: self.bounds.size.width, height: 30)
        labelView.textAlignment = .left
        labelView.text = storyCard!.GetTitle(section: tag)
        labelView.font = UIFont(name: "Arial-BoldMT", size: 23)
        labelView.textColor = .hex(rgb: 0xC35EB9)
        //labelView.backgroundColor = .hex(rgb: 0x191919)
    }
}

extension TableCardViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return storyCard!.GetItemsInSectionCount(section: tag)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellWithCollectionView", for: indexPath)
        
        let sv = storyCard!.GetCardViewBySectionAndIndex(
            section: tag,
            index: indexPath.item)
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
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
    {
        return CGSize(width: 115, height: collectionView.frame.height)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat
    {
        return 10
    }
    
}

extension TableCardViewCell: UICollectionViewDelegate {
 
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       print("User tapped on section \(tag) item \(indexPath.item)")
    }
}

