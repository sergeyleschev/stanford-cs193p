//
//  Card.swift
//  Set
//
//  Created by Sergey Leschev on 13.07.20.
//  Copyright © 2020 Sergey Leschev. All rights reserved.
//

import Foundation


struct Card: Hashable, CustomStringConvertible {
    var description: String { return "\(number)-\(shape)-\(color)-\(fill)" }
    
    /// Card's unique identifier
    private(set) var identifier: Int
    /// Card's attributes
    let number: Int
    let shape: Int
    let color: Int
    let fill: Int
    
    private static var identifierFactory = 0
    
    
    /// Retuns instance of 'Card'
    /// - Parameters:
    ///     - numberOfFigures: number of figures on the card
    ///     - shape: Shape of card's figure.
    ///              Can be one of three variants of 'Int' - 1, 2, 3
    ///     - color: Color of the figure.
    ///              Can be one of three variants of 'Int' - 1, 2, 3
    ///     - fill:  Fill of the figure.
    ///              Can be one of three variants of 'Int' - 1, 2, 3
    init(numberOfFigures: Int, shape: Int, color: Int, fill: Int) {
        // Setting unique identifier for card
        self.identifier = Card.getUniqueIdentifier()
        self.number = numberOfFigures
        self.shape = shape
        self.color = color
        self.fill = fill
    }

    
    /// Generates and returns unique identifier for card
    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    
    // Implementation of 'Hashable' Protocol
    func hash(into hasher: inout Hasher) { hasher.combine(identifier) }
    static func == (lhs: Card, rhs: Card) -> Bool { lhs.identifier == rhs.identifier }
}
