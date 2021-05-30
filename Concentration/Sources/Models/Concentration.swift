//
//  Concentration.swift
//  Concentration
//
//  Created by Sergey Leschev on 1.06.20.
//  Copyright © 2020 Sergey Leschev. All rights reserved.
//

import Foundation


struct Concentration {
    private struct Scoring {
        // 10 scores if cards are matched
        static let matchBonus       = 10
        // 5 scores penalty if missmatch
        static let missmatchPenalty = 5
        static let maxTimePenalty   = 5
    }
    
    private var clickDate: Date?
    private var timePenalty: Int { min(-Int(clickDate?.timeIntervalSinceNow ?? 0), Scoring.maxTimePenalty) }

    private (set) var cards = [Card]()
    var flipCount = 0
    var scoreCount = 0
    
    private var seenCards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter { cards[$0].isFaceUp }.oneAndOnly }
        set {
            // turn all the cards face down except the card at index newValue
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }

    
    init(numberOfPairOfCards: Int) {
        assert(numberOfPairOfCards > 0, "Concentration.init(\(numberOfPairOfCards)): you must have at least one pair of cards")
        for _ in 1...numberOfPairOfCards {
            let card = Card()
            cards += [card, card]
        }
        cards.shuffle()
    }
    
    
    mutating func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index): no card with such index")
        // Checks, if a card is not matched
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex] == cards[index] {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    scoreCount += (Scoring.matchBonus - timePenalty)
                }
                cards[index].isFaceUp = true
            } else {
                indexOfOneAndOnlyFaceUpCard = index
            }
            if !seenCards.contains(cards[index]) {
                seenCards.append(cards[index])
            } else if !cards[index].isMatched {
                scoreCount -= Scoring.missmatchPenalty
            }
            flipCount += 1
            clickDate = Date()
        }
    } // End of chooseCard:at:
    
    
    mutating func reset() {
        self.flipCount = 0
        self.scoreCount = 0
        self.seenCards = []
        for index in cards.indices {
            cards[index].isFaceUp = false
            cards[index].isMatched = false
        }
        cards.shuffle()
    }

}
