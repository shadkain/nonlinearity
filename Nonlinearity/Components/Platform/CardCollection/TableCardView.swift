//
//  TableCardView.swift
//  Nonlinearity
//
//  Created by Юлия Плаксина on 19/04/2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

class TableCardView: UIViewController {
    let customIdentifier = "CustomTableViewCell"
    var tableView: UITableView?
    
    var storyCard = StoryCard()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var tableViewFrame = view.frame
        
        tableViewFrame.size.height = 600
        tableViewFrame.origin.y = 225
        
        tableView = UITableView(frame: tableViewFrame)
        tableView!.backgroundColor = .white
        
        tableView!.backgroundColor = .hex(rgb: 0x191919)
        tableView!.separatorStyle = .none
        
        tableView!.dataSource = self
       // tableView!.delegate = self
        tableView!.register(TableCardViewCell.self, forCellReuseIdentifier: customIdentifier)
        
        view.addSubview(tableView!)
        
        //self.updateLayout(with: self.view.frame.size)
    }
    
//    private func updateLayout(with size: CGSize) {
//       tableView!.frame = CGRect.init(origin: .zero, size: size)
//    }
    
//    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
//       super.viewWillTransition(to: size, with: coordinator)
//       coordinator.animate(alongsideTransition: { (contex) in
//        self.updateLayout(with: size)
//       }, completion: nil)
//    }
}

extension TableCardView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
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
