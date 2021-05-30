//
//  Card.swift
//  Concentration
//
//  Created by Sergey Leschev on 1.06.20.
//  Copyright © 2020 Sergey Leschev. All rights reserved.
//

import Foundation


struct Card: Hashable {
	var isFaceUp = false
	var isMatched = false
	private var identifier: Int
	
	private static var identifierFactory = 0
	
    
	init() {
		self.identifier = Card.getUniqueIdentifier()
	}
    
    
    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    
    func hash(into hasher: inout Hasher) { hasher.combine(identifier) }
    static func == (lhs: Card, rhs: Card) -> Bool { lhs.identifier == rhs.identifier }
}


