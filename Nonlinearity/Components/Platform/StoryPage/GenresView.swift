//
//  GenresView.swift
//  Nonlinearity
//
//  Created by Юлия Плаксина on 26/05/2020.
//  Copyright © 2020 Святослав Кряжев. All rights reserved.
//

import UIKit

class GenresView: UIViewComponent {
    private var genres: [String] = []
    private var genreViews: [[UILabel]] = []
    private var textWidth: [[CGFloat]] = []
    private var rowWidth: [CGFloat] = []
    
    private let font = UIFont.systemFont(ofSize: 13)
    private let distanceHor: CGFloat = 5
    
    func setGenres(newGenres: [String]) {
        genres = newGenres
        
        var w: CGFloat = 0
        var arrLabel: [UILabel] = []
        var arrSize: [CGFloat] = []
        for genre in genres {
            let genreWidth = genre.width(usingFont: font) + 8
            
            if w + genreWidth + 5 > UIScreen.main.bounds.size.width - 40 {
                genreViews.append(arrLabel)
                arrLabel = []
                textWidth.append(arrSize)
                arrSize = []
                rowWidth.append(w)
                w = 0
            }
            w += genreWidth
            
            if !arrLabel.isEmpty {
                w += distanceHor
            }
            
            arrLabel.append(makeGenre(text: genre))
            arrSize.append(genreWidth)
        }
        
        genreViews.append(arrLabel)
        textWidth.append(arrSize)
        rowWidth.append(w)
        
        for i in 0...(genreViews.count - 1) {
            for j in 0...(genreViews[i].count - 1) {
                addSubview(genreViews[i][j])
                genreViews[i][j].translatesAutoresizingMaskIntoConstraints = false
                
                if i == 0 {
                    NSLayoutConstraint.activate([
                        genreViews[i][j].topAnchor.constraint(equalTo: topAnchor),
                    ])
                } else {
                    NSLayoutConstraint.activate([
                        genreViews[i][j].topAnchor.constraint(equalTo: genreViews[i - 1][0].bottomAnchor,
                                                              constant: 10),
                    ])
                }
                
                NSLayoutConstraint.activate([
                    genreViews[i][j].widthAnchor.constraint(equalToConstant: textWidth[i][j])
                ])
                
                if j != 0 {
                    NSLayoutConstraint.activate([
                        genreViews[i][j].leadingAnchor.constraint(
                            equalTo: genreViews[i][j - 1].trailingAnchor,
                            constant: distanceHor),
                    ])
                }
            }

            let anchors = (UIScreen.main.bounds.size.width - rowWidth[i]) / 2
            
            NSLayoutConstraint.activate([
                genreViews[i][0].leadingAnchor.constraint(equalTo: leadingAnchor, constant: anchors),
                genreViews[i][genreViews[i].count - 1].trailingAnchor.constraint(equalTo: trailingAnchor, constant: anchors*(-1)),
            ])
        }
    }
    

    private func makeGenre(text: String) -> UILabel {
        let genreUILable = UILabel()
        genreUILable.text = text
        
        genreUILable.backgroundColor = .hex(rgb: 0x303030)
        
        genreUILable.layer.cornerRadius = 8
        genreUILable.clipsToBounds = true
        
        genreUILable.textAlignment = .center
        genreUILable.textColor = .hex(rgb: 0x949494)
        genreUILable.font = font
        
        return genreUILable
    }
}
