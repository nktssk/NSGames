//
//  AdTableViewCell.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 08.04.2021.
//

import UIKit
import SnapKit

class AdTableViewCell: UITableViewCell {

    static let identifier = "AdTableViewCell"

    // MARK: - UI
    let nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        return label
    }()

    let numberOfOffersLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return label
    }()

    let staticNumberOfOffersLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.text = "Количество предложений ⚠️"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()

    let numberOfViewsLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return label
    }()

    let staticNumberOfViewsLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.text = "Количество просмотров 👀"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()

    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()

    let offerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.contentMode = .scaleToFill
        stackView.axis = .horizontal
        stackView.spacing = 5
        return stackView
    }()

    let viewsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.contentMode = .scaleToFill
        stackView.axis = .horizontal
        stackView.spacing = 5
        return stackView
    }()

    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        accessoryType = .disclosureIndicator
        addSubviews()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public UI Methods
    func setData(configuration: Ad) {
        nameLabel.text = configuration.name
        numberOfOffersLabel.text = "\(configuration.numberOfOffers)"
        numberOfViewsLabel.text = "\(configuration.views)"
    }

    // MARK: - Private Methods
    private func addSubviews() {
        contentView.addSubview(stackView)
        offerStackView.addArrangedSubview(staticNumberOfOffersLabel)
        offerStackView.addArrangedSubview(numberOfOffersLabel)
        viewsStackView.addArrangedSubview(staticNumberOfViewsLabel)
        viewsStackView.addArrangedSubview(numberOfViewsLabel)
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(offerStackView)
        stackView.addArrangedSubview(viewsStackView)
    }

    private func setConstraints() {
        staticNumberOfOffersLabel.snp.contentHuggingHorizontalPriority = 0
        numberOfOffersLabel.snp.contentHuggingHorizontalPriority = 1000
        staticNumberOfViewsLabel.snp.contentHuggingHorizontalPriority = 0
        numberOfViewsLabel.snp.contentHuggingHorizontalPriority = 1000

        stackView.snp.makeConstraints { (make: ConstraintMaker) in
            make.top.leading.equalToSuperview().offset(6)
            make.bottom.trailing.equalToSuperview().inset(6)
        }
    }
}
