//
//  GameFieldView.swift
//  Set
//
//  Created by Sergey Leschev on 9.08.20.
//  Copyright © 2020 Sergey Leschev. All rights reserved.
//

import UIKit


class GameFieldView: UIView {
    struct Constant {
        static let cellAspectRatio: CGFloat = 0.7
        static let space: CGFloat = 2.0
    }
    
    
    // cards in game
    var cardViews = [CardView]() {
        willSet { removeSubviews() }
        didSet { addSubviews(); setNeedsLayout() }
    }
    
    
    private func removeSubviews() {
        for card in cardViews { card.removeFromSuperview() }
    }
    
    
    private func addSubviews() {
        for card in cardViews { addSubview(card) }
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        var grid = Grid(aspectRatio: Constant.cellAspectRatio, frame: bounds)
        grid.cellCount = cardViews.count
        for index in cardViews.indices {
            let cardView = cardViews[index]
            cardView.frame = grid[index]!.insetBy(dx: Constant.space, dy: Constant.space)
        }
    }

}
