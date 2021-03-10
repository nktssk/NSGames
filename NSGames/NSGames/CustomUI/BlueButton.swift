//
//  BlueButton.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 05.03.2021.
//

import UIKit

class BlueButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.buttonBlue
        layer.cornerRadius = 14
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
