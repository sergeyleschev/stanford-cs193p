//
//  CGRect.swift
//  Set
//
//  Created by Sergey Leschev on 13.07.20.
//  Copyright © 2020 Sergey Leschev. All rights reserved.
//

import UIKit


extension CGRect {
    func inset(by size: CGSize) -> CGRect { insetBy(dx: size.width, dy: size.height) }
    
    func sized(to size: CGSize) -> CGRect { CGRect(origin: origin, size: size) }
    
    func zoom(by scale: CGFloat) -> CGRect {
        let newWidth = width * scale
        let newHeight = height * scale
        return insetBy(dx: (width - newWidth) / 2, dy: (height - newHeight) / 2)
    }
}
