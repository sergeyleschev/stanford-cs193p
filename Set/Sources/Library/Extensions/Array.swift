//
//  Array.swift
//  Set
//
//  Created by Sergey Leschev on 13.07.20.
//  Copyright © 2020 Sergey Leschev. All rights reserved.
//

extension Array where Element: Hashable {
    /// Replaces elements at specified positions with new ones
    /// - Parameters:
    ///     - oldElements: Array with Elements to replace, if found in 'self'
    ///     - newElements: New elements
    mutating func replaceElements(_ oldElements: [Element], to newElements: [Element]) {
        guard oldElements.count == newElements.count else { return }
        for count in 0..<oldElements.count {
            if let destinationIndex = self.firstIndex(of: oldElements[count]) {
                self[destinationIndex] = newElements[count]
            }
        }
    }
    
    
    mutating func removeElements(_ elements: [Element]) {
        self = self.filter { !elements.contains($0) }
    }
}


extension Array {
    subscript(_ value: Card.Value) -> Element { self[(value.rawValue - 1)] }
}
