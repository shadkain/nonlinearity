//
//  TableCardViewCell.swift
//  Nonlinearity
//
//  Created by Юлия Плаксина on 20/04/2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//


import UIKit

class TableCardViewCell: UITableViewCell {
    private var labelView = UILabel()
    var storyCard: StoryCard?
    var collectionView: UICollectionView?
    
    var currentTypeOfTab: TypeOfTab?
    
    weak var vc: MainPageView?
    private let networkManager: NetworkManagerDescription = NetworkManager.shared
    
    private var flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    
    func initCell () {
        contentView.backgroundColor = .hex(rgb: 0x191919)
        
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 114, height: 190)
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 0)
        
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
        labelView.text = storyCard!.getTitle(section: tag)
        labelView.font = UIFont(name: "Arial-BoldMT", size: 23)
        labelView.textColor = .hex(rgb: 0xC35EB9)
    }
    
    override func prepareForReuse() {
        
    }
}

extension TableCardViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return storyCard!.getItemsInSectionCount(tab: currentTypeOfTab ?? .main, section: tag)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellWithCollectionView", for: indexPath)
        
        for subview in myCell.contentView.subviews {
            subview.removeFromSuperview()
        }
        
        let card = storyCard!.getCardBySectionAndIndex(
            tab: currentTypeOfTab ?? .main,
            section: tag,
            index: indexPath.item)
        
        let sv = StoryCardView(frame: .zero)
        
        networkManager.getAvatarStoryData(avatarStoryPath: card.image!) { (data) in
            DispatchQueue.main.async {
                if !data!.isEmpty {
                    sv.image = UIImage(data: data!)
                }
            }
            return
        }
        
        sv.nameLable.text = card.title
        if card.rating! > 8 {
            sv.setRate()
        }
        if card.editorChoice! {
            sv.setFirstRate()
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

extension TableCardViewCell: UICollectionViewDelegate {
 
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {        vc!.openStoryPage(id: storyCard!.getID(section: tag, index: indexPath.item))
    }
}


