//
//  CardsCollectionViewAdapter.swift
//  Nonlinearity
//
//  Created by Юлия Плаксина on 20/05/2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

class CardsCollectionViewAdapter: UIViewComponent {
    var storyCard: StoryCardCollection?
    var collectionView: UICollectionView?
    
    private var flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    
    override func setup() {
        flowLayout.scrollDirection = .vertical
        flowLayout.itemSize = CGSize(width: 114, height: 190)
        flowLayout.minimumInteritemSpacing = 5
        
        var margin: CGFloat = 10
        if UIScreen.main.bounds.size.width > 400 {
            margin = 20
        }
        
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: margin, bottom: 0, right: margin)
        
        collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: flowLayout)

        collectionView!.backgroundColor = .hex(rgb: 0x191919)
        collectionView!.dataSource = self
        collectionView!.delegate = self

        // Setting the collection view scrolling behaviour
        collectionView!.isPagingEnabled = true
        collectionView!.isScrollEnabled = true
        collectionView!.setContentOffset(CGPoint(x: 0,y: 0), animated: true)

        collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CardsCollectionView")
    }
}

extension CardsCollectionViewAdapter: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return storyCard!.getItemsCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardsCollectionView", for: indexPath)
        
        for subview in myCell.contentView.subviews {
            subview.removeFromSuperview()
        }
        
        let card = storyCard!.getCardByIndex(index: indexPath.item)
        
        let sv = StoryCardView(frame: .zero)
        
        sv.image = UIImage(named: card.imageName)
        sv.nameLable.text = card.title
        
        if card.isFirstRated {
            sv.setFirstRate()
        }
        if card.isRated {
            sv.setRate()
        }
        if card.isListenable {
            sv.setListenable()
        }
        if card.isPlayable {
            sv.setPlayable()
        }
        
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

extension CardsCollectionViewAdapter: UICollectionViewDelegate {
 
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       print("User tapped on section \(tag) item \(indexPath.item)")
    }
}
