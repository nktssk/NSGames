//
//  SelectGameTableViewCell.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 27.03.2021.
//

import UIKit

class SelectGameTableViewCell: UITableViewCell {

    static let identifier = "SelectGameTableViewCell"

    // MARK: - Properties
    var isCheckMark = false {
        didSet {
            if isCheckMark {
                accessoryType = .checkmark
            } else {
                accessoryType = .none
            }
        }
    }

    // MARK: - Lifecycle
    override func prepareForReuse() {
        super.prepareForReuse()
        accessoryType = .none
    }

    // MARK: - Public UI Methods
    func setData(configuration: Game) {
        textLabel?.text = configuration.name
    }
}
