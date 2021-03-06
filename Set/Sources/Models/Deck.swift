//
//  Deck.swift
//  Set
//
//  Created by Sergey Leschev on 13.07.20.
//  Copyright © 2020 Sergey Leschev. All rights reserved.
//

import Foundation


struct Deck {
    /// Deck of cards
    var cards: [Card]
    
    /// Returns number of cards in deck
    var count: Int { return self.cards.count }


    init() {
        // Initializing 'deck' with 81 'Card's.
        self.cards = Deck.make()
    }
    
    
    //    MARK: - Creating Deck
    ///    Creates an Array of 'Card's.
    /// - Returns: Shuffled array of 'Card's.
    private static func make() ->[Card] {
        let attributes = Deck.attributesForCardsWithOptions([Card.Value.v1, Card.Value.v2, Card.Value.v3], count: 4)
        return attributes.map { Card(numberOfFigures: $0[0].rawValue, shape: $0[1], color: $0[2], fill: $0[3]) }.shuffled()
    }
    
    
    ///    Creates an array of arrays [[1, 2, 3, 4]...] with the values of the cards attributes;
    ///    where 1st element of inner array - number of figures, 2nd - shape etc.
    ///    - Parameters:
    ///      - Options: array of permissible attribute values;
    ///        for example, for the attribute 'color' it might be - 1 - blue, 2 - purple, 3 - red)
    ///      - count: number of attributes of 'Card' (number, shape, color, fill).
    ///    - Returns: Array of arrays with attribute values for cards [[1, 1, 1, 1] ... [3, 3, 3, 3]].
    private static func attributesForCardsWithOptions<T>(_ options: [T], count: Int) -> [[T]] {
        guard options.count >= 0 && count > 0 else { return [[]] }
        var permutations = [[T]]()
        for option in options {
            permutations += attributesForCardsWithOptions(options, count: count - 1).map {[option] + $0}
        }
        return permutations
    }
    
}
