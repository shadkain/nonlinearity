//
//  TableCardViewAdapter.swift
//  Nonlinearity
//
//  Created by Юлия Плаксина on 20/04/2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

class TableCardViewAdapter: UIViewComponent {
    let customIdentifier = "CustomTableViewCell"
    var tableView: UITableView!
    
    var storyCard = StoryCard()
    var currentTypeOfTab: TypeOfTab = .main
    
    weak var vc: MainPageView?
    
    override func setup() {
        tableView = UITableView(frame: frame)
        
        tableView.backgroundColor = .hex(rgb: 0x191919)
        tableView.backgroundColor = .black
        
        tableView.separatorStyle = .none
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TableCardViewCell.self, forCellReuseIdentifier: customIdentifier)
    }
}

extension TableCardViewAdapter: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if tableView.contentOffset.y < 0 {
            tableView.contentOffset.y = 0
        }
        
        if tableView.contentOffset.y > tableView.frame.height {
            tableView.contentOffset.y = 0
        }
    }

}

extension TableCardViewAdapter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let tableViewCell = tableView.dequeueReusableCell(withIdentifier: customIdentifier, for: indexPath) as? TableCardViewCell else {
            fatalError("Cell should be not nil")
        }
        tableViewCell.tag = indexPath.row
        tableViewCell.storyCard = storyCard
        tableViewCell.vc = vc!
        tableViewCell.currentTypeOfTab = currentTypeOfTab
        tableViewCell.selectionStyle = .none
        tableViewCell.initCell()
        return tableViewCell
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storyCard.getSectionsCount()
    }
}
