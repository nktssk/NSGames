//
//  HomeScreenCollectionViewCell.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 14.03.2021.
//

import UIKit
import SnapKit

class HomeScreenCollectionViewCell: UICollectionViewCell {

    static let identifier = "HomeScreenCollectionViewCell"
    private var configuration: HomeScreenCellConfig?
    weak var delegate: HomeScreenCellDelegate?

    // MARK: - UI
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 14
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.numberOfLines = 2
        return label
    }()

    let timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 11, weight: .regular)
        label.textColor = UIColor.grayLabel
        label.numberOfLines = 2
        return label
    }()

    let likeButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "Heart"), for: .normal)
        return button
    }()

    let infoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.spacing = 5
        return stackView
    }()

    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.spacing = 5
        return stackView
    }()

    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        likeButton.addTarget(self, action: #selector(likeButtonAction), for: .touchUpInside)
        contentView.layer.cornerRadius = 14
        layer.shadowRadius = 6
        layer.shadowOpacity = 0.15
        layer.shadowPath = UIBezierPath(rect: bounds.offsetBy(dx: 0, dy: 10)).cgPath
        self.clipsToBounds = false
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        likeButton.setImage(#imageLiteral(resourceName: "Heart"), for: .normal)
    }

    func setData(configuration: HomeScreenCellConfig) {
        self.configuration = configuration
        imageView.image = configuration.image
        nameLabel.text = configuration.name
        if configuration.isLiked {
            likeButton.setImage(#imageLiteral(resourceName: "SelectedHeart"), for: .normal)
        }
        timeLabel.text = Date.toString(date: configuration.date)
    }

    // MARK: - Objc Methods
    @objc func likeButtonAction(loaded: Bool = true) {
        guard var configuration = configuration else {
            return
        }
        if configuration.isLiked {
            likeButton.setImage(#imageLiteral(resourceName: "Heart"), for: .normal)
            configuration.isLiked = false
        } else {
            let pulse = PulseAnimation(radius: likeButton.frame.width * 1.3, postion: likeButton.center)
            pulse.animationDuration = 0.7
            pulse.backgroundColor = #colorLiteral(red: 0.2271029055, green: 0.5911584496, blue: 0.994132936, alpha: 1)
            stackView.layer.insertSublayer(pulse, below: stackView.layer)
            likeButton.setImage(#imageLiteral(resourceName: "SelectedHeart"), for: .normal)
            configuration.isLiked = true
        }
        self.configuration = configuration
        delegate?.likeAd(config: configuration)
    }

    // MARK: - Private Methods
    private func setConstraints() {
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints { (make: ConstraintMaker) in
            make.height.equalTo(contentView.snp.width).multipliedBy(0.7)
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }

        contentView.addSubview(infoStackView)
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(likeButton)
        infoStackView.addArrangedSubview(stackView)
        infoStackView.addArrangedSubview(timeLabel)
        infoStackView.snp.makeConstraints { (make: ConstraintMaker) in
            make.top.equalTo(imageView.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.bottom.equalToSuperview().offset(-10)
        }

        likeButton.snp.makeConstraints { (make: ConstraintMaker) in
            make.height.equalTo(infoStackView.snp.width).multipliedBy(0.15)
            make.width.equalTo(infoStackView.snp.width).multipliedBy(0.15 * 48 / 45)
        }
    }
}
