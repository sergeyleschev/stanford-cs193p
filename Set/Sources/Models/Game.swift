//
//  Game.swift
//  Set
//
//  Created by Sergey Leschev on 13.07.20.
//  Copyright © 2020 Sergey Leschev. All rights reserved.
//

import Foundation


struct Game {
    // Points for player's actions
    private enum Points: Int {
        case matched    =  3
        case mismatched = -5
        case deselected = -1
    }
    
    enum MatchState { case matched, notMatched, notSet }
    
    private var deck: Deck
    
    /// Returns number of cards in deck.
    var numbederOfCardsInDeck: Int { return deck.count }
    
    /// Cards currently in the game
    private(set) var cardsInGame = [Card?]()
    
    /// Cards been selected for matching
    private(set) var selectedCards = [Card]()
    
    /// Cards from last matched set
    private(set) var matchedCards = [Card]()
    
    // Counter of successful matches
    private(set) var matchedSets = 0
    
    // Scores of the current game
    private(set) var score = 0
    
    
    /// Creates instance of Deck and
    init() {
        self.deck = Deck()
        self.cardsInGame = takeCardsFromDeck(amount: 12)
    }
    
    
    /// Puts taken [Card] from the deck to 'cardsInGame'
    mutating func deal(_ amount: Int) {
        if gameMatchState == .matched {
            cleanAfterMatching()
        } else {
            let cards = takeCardsFromDeck(amount: amount)
            cardsInGame += cards
        }
    }
    
    
    /// Can have one of three states of type 'MatchState':
    /// .matched, .notMatched, .notSet
    private(set) var gameMatchState: MatchState = .notSet
    
    /// Toggle card selection
    mutating func chooseCard(_ card: Card) {
        if !selectedCards.contains(card) {
            selectCard(card)
        } else {
            deselectCard(card)
        }
    }
    
    ///  Returns '[Card]' by removing 'number' of 'Card's in 'deck'
    ///  if 'deck' has that number of 'Card's.
    private mutating func takeCardsFromDeck(amount: Int) -> [Card] {
        assert(deck.count > 0, "There are no cards in the deck.")
        var cards = [Card]()
        for _ in 1...amount {
            cards.append(deck.cards.removeFirst())
        }
        return cards
    }
    
    
    private mutating func selectCard(_ card: Card) {
        if selectedCards.count       < 2 { selectedCards.append(card) }
        else if selectedCards.count == 2 { selectedCards.append(card); matchCards() }
        else if selectedCards.count == 3 { cleanAfterMatching(); selectedCards.append(card) }
    }
    
    
    private mutating func deselectCard(_ card: Card) {
        assert(selectedCards.contains(card), "There is no such 'Card' in 'selectedCards'")
        if let cardIndex = selectedCards.firstIndex(of: card) {
            selectedCards.remove(at: cardIndex)
            setScore(for: .deselected)
        }
    }
    
    
    private mutating func matchCards() {
        guard selectedCards.count == 3 else { return }
        // Testing whether cards is matched
        let sum = [
            selectedCards.reduce(0, { $0 + $1.number }),
            selectedCards.reduce(0, { $0 + $1.shape.rawValue }),
            selectedCards.reduce(0, { $0 + $1.color.rawValue }),
            selectedCards.reduce(0, { $0 + $1.fill.rawValue })
        ]
        let isMatched = sum.reduce(true, { $0 && ($1 % 3 == 0) })
        if isMatched {
            // Populate 'matchedCards' with contents of 'selectedCard'
            matchedCards += selectedCards
            matchedSets += 1
            gameMatchState = .matched
            setScore(for: .matched)
        } else {
            gameMatchState = .notMatched
            setScore(for: .mismatched)
        }
    }
    
    
    private mutating func cleanAfterMatching() {
        // remove contents of 'selectedCards'
        selectedCards.removeAll()
        // Doing the rest only if set is matched
        guard gameMatchState == .matched else { return }
        // If set is matched, take new 3 cards from the deck;
        // Replace matched cards in 'cardsInGame' with new ones;
        // or remove matched cards if no cards in the deck
        if numbederOfCardsInDeck > 0 {
            let newCards = takeCardsFromDeck(amount: 3)
            cardsInGame.replaceElements(matchedCards, to: newCards)
        } else {
            cardsInGame.removeElements(matchedCards)
        }
        // remove contents of 'matchedCards'
        matchedCards.removeAll()
        gameMatchState = .notSet
    }
    
    
    /// Sets 'score' of the game for player's action:
    /// Set matched: +3 points, mismatched: -3, card was deselected: -1 point.
    /// - Parameters:
    ///     - action: type 'Points'
    private mutating func setScore(for action: Points) {
        self.score += action.rawValue
    }
}
