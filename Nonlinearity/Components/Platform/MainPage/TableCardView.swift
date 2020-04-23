//
//  TableCardView.swift
//  Nonlinearity
//
//  Created by Юлия Плаксина on 20/04/2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

class TableCardView: UIViewController {
    let customIdentifier = "CustomTableViewCell"
    var tableView: UITableView?
    
    var storyCard = StoryCard()
    var bubbleAdapter = BubbleViewCollectionAdapter()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView(frame: view.frame)
        //tableView!.tableHeaderView = bubbleAdapter.collectionView
        //tableView!.tableHeaderView?.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 125)
        tableView!.backgroundColor = .white
        
        tableView!.backgroundColor = .hex(rgb: 0x191919)
        tableView!.separatorStyle = .none
        
        tableView!.dataSource = self
        tableView!.delegate = self
        tableView!.register(TableCardViewCell.self, forCellReuseIdentifier: customIdentifier)
        
        view.addSubview(bubbleAdapter.collectionView!)
        view.addSubview(tableView!)
        setConstraint()
    }
    
    func setConstraint() {
        bubbleAdapter.collectionView!.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
             bubbleAdapter.collectionView!.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
             bubbleAdapter.collectionView!.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
             bubbleAdapter.collectionView!.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
             bubbleAdapter.collectionView!.heightAnchor.constraint(equalToConstant: 125),
        ])
        
        tableView!.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView!.topAnchor.constraint(equalTo: bubbleAdapter.collectionView!.bottomAnchor),
             tableView!.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
             tableView!.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
             tableView!.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

extension TableCardView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if tableView!.contentOffset.y < 0 {
            tableView!.contentOffset.y = 0
        }
    }

}

extension TableCardView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let tableViewCell = tableView.dequeueReusableCell(withIdentifier: customIdentifier, for: indexPath) as? TableCardViewCell else {
            fatalError("Cell should be not nil")
        }
        tableViewCell.tag = indexPath.row
        tableViewCell.storyCard = storyCard
        tableViewCell.selectionStyle = .none
        tableViewCell.initCell()
        return tableViewCell
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storyCard.GetSectionsCount()
    }
}
