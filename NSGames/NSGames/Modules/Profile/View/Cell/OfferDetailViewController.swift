//
//  OfferDetailTableViewCell.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 08.04.2021.
//

import UIKit
import SnapKit

protocol OfferDetailTableViewCellDelegate: AnyObject {
    func goToChat(id: Int)
    func showTradeList(id: Int)
}

class OfferDetailTableViewCell: UITableViewCell {

    static let identifier = "OfferDetailTableViewCell"

    // MARK: - Properties
    var offer: Offer?
    weak var delegate: OfferDetailTableViewCellDelegate?

    // MARK: - UI
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        return label
    }()

    let descriprionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        return label
    }()

    let staticDescriprionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.text = "✍️ Комментарий:"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()

    let tradeLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.text = "🤝 Обмен на: "
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()

    let staticPriceLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.text = "🪙 Предложенная цена:"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()

    let priceLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        return label
    }()

    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .equalSpacing
        stackView.alignment = .leading
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()

    let tradeListButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.buttonBlue, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        return button
    }()

    let writeButton: RoundedButton = {
        let button = RoundedButton()
        button.backgroundColor = .grayLight
        button.setTitleColor(.gray, for: .normal)
        button.setTitle("Написать пользователю", for: .normal)
        return button
    }()

    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setConstraints()
        writeButton.addTarget(self, action: #selector(writeButtonAction), for: .touchUpInside)
        tradeListButton.addTarget(self, action: #selector(tradeListButtonAction), for: .touchUpInside)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Objc Methods
    @objc func writeButtonAction() {
        if let id = offer?.id {
            delegate?.goToChat(id: id)
        }
    }

    @objc func tradeListButtonAction() {
        if let id = offer?.id {
            delegate?.showTradeList(id: id)
        }
    }

    // MARK: - Public UI Methods
    func setData(configuration: Offer) {
        usernameLabel.text = configuration.username
        if let price = configuration.price {
            priceLabel.text = String(price)
        } else {
            priceLabel.removeFromSuperview()
            staticPriceLabel.removeFromSuperview()
        }
        if let description = configuration.description {
            descriprionLabel.text = description
        } else {
            descriprionLabel.removeFromSuperview()
            staticDescriprionLabel.removeFromSuperview()
        }
        if let count = configuration.tradeListCount {
            tradeListButton.setTitle("\(count) игр для обмена", for: .normal)
        } else {
            tradeLabel.removeFromSuperview()
            tradeListButton.removeFromSuperview()
        }
        offer = configuration
    }

    // MARK: - Private Methods
    private func addSubviews() {
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(usernameLabel)
        stackView.addArrangedSubview(staticPriceLabel)
        stackView.addArrangedSubview(priceLabel)
        stackView.addArrangedSubview(staticDescriprionLabel)
        stackView.addArrangedSubview(descriprionLabel)
        stackView.addArrangedSubview(tradeLabel)
        stackView.addArrangedSubview(tradeListButton)
        stackView.addArrangedSubview(writeButton)
    }

    private func setConstraints() {
        writeButton.snp.makeConstraints { (make: ConstraintMaker) in
            make.height.equalTo(44)
            make.trailing.equalToSuperview().inset(10)
            make.leading.equalToSuperview().offset(10)
        }

        stackView.snp.makeConstraints { (make: ConstraintMaker) in
            make.top.equalToSuperview().offset(12)
            make.leading.equalToSuperview().offset(6)
            make.trailing.equalToSuperview().inset(6)
            make.bottom.trailing.equalToSuperview().inset(12)
        }
    }
}
