//
//  Theme.swift
//  Concentration
//
//  Created by Sergey Leschev on 1.06.20.
//  Copyright Β© 2020 Sergey Leschev. All rights reserved.
//

import Foundation
import UIKit


struct Theme {
    let name: String
    let emojis: String
    let backgroundColor: UIColor
    let cardBackColor: UIColor
    
    
    // Added extra functionality - background color and card color varies from theme to theme.
    static private var themes = [
        Theme(name: "Halloween", emojis: "ππ»β οΈπ½ππ¦πΈπ·π§ββοΈπ§ββοΈ", backgroundColor: .black, cardBackColor: .orange),
        Theme(name: "Animals", emojis: "πΆπ±π­πΉπ°π¦π»πΌπ¨π―", backgroundColor: #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1), cardBackColor: #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)),
        Theme(name: "Faces", emojis: "ππππππ₯°πππ€©π€", backgroundColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), cardBackColor: #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)),
        Theme(name: "Winter", emojis: "βοΈβοΈβοΈπ¬π¨π¨βοΈ", backgroundColor: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), cardBackColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)),
        Theme(name: "Activity", emojis: "β½οΈπβΎοΈππ₯βΈπποΈββοΈβ·π§ββοΈ", backgroundColor: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1), cardBackColor: #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)),
        Theme(name: "Objects", emojis: "βοΈπ±π»π₯πΈπΉπβ°β±π", backgroundColor: #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1), cardBackColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
    ]
    
    
    static func getRandomTheme() -> Theme { themes[Int.random(in: 0..<themes.count)] }
    
}
