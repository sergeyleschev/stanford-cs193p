//
//  UIButton.swift
//  Set
//
//  Created by Sergey Leschev on 13.07.20.
//  Copyright © 2020 Sergey Leschev. All rights reserved.
//

import UIKit


extension UIButton {
    open override var isEnabled: Bool {
        didSet {
            self.backgroundColor = self.isEnabled ? Theme.buttonColor : Theme.buttonColorDisabled
        }
    }
}
