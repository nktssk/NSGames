//
//  File.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 03.03.2021.
//

import UIKit

class PrettyTextField: UITextField {

    // MARK: - UI
    private let border = UIView()

    // MARK: - Constants
    let offset: CGFloat = 8
    let placeholderSize: CGFloat = 18
    let interval: TimeInterval = 0.25
    let color = UIColor.grayLabel

    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 5, right: 0)))
        font = UIFont.systemFont(ofSize: 18, weight: .medium)
        clearButtonMode = .whileEditing
        autocapitalizationType = .none
        returnKeyType = .done
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }

    // MARK: - UITextField
    override func layoutSubviews() {
        super.layoutSubviews()
        border.frame = CGRect(x: 0, y: bounds.height + 1.5, width: bounds.width, height: 1.5)
    }

    // MARK: - Private Methods
    private func setupUI() {
        borderStyle = .none
        addSubview(border)
        border.backgroundColor = color
        border.isUserInteractionEnabled = false
    }
}
