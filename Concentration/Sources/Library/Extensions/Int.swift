//
//  Int.swift
//  Concentration
//
//  Created by Sergey Leschev on 1.06.20.
//  Copyright © 2020 Sergey Leschev. All rights reserved.
//

extension Int {
    var randomIndex: Int {
        if self > 0 { return Int.random(in: 1..<self) }
        else {
             if self < 0 { return -Int.random(in: 1..<abs(self)) }
             else { return 0 }
        }
    }
}
