//
//  BlueTextButton.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 05.03.2021.
//

import UIKit

class BlueTextButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setTitleColor(UIColor.buttonBlue, for: .normal)
        setTitleColor(UIColor.buttonBlueSeleted, for: .highlighted)
        titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .medium)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
