//
//  GrayLabel.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 05.03.2021.
//

import UIKit

class GrayLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        font = UIFont.systemFont(ofSize: 15)
        tintColor = .grayLabel
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}
