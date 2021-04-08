//
//  ProfileHeader.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 08.04.2021.
//

import UIKit
import SnapKit

class ProfileHeaderView: UIView {
    // MARK: - UI
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = #imageLiteral(resourceName: "avatar")
        return imageView
    }()

    let usernameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        return label
    }()

    let emailLabel: GrayLabel = {
        let label = GrayLabel()
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label
    }()

    let aboutLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()

    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.spacing = 5
        return stackView
    }()

    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setConstraints()
        backgroundColor = .white
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setImage(image: UIImage) {
        imageView.image = image
    }

    // MARK: - Private Methods
    private func addSubviews() {
        addSubview(imageView)
        addSubview(stackView)
        stackView.addArrangedSubview(usernameLabel)
        stackView.addArrangedSubview(emailLabel)
        stackView.addArrangedSubview(aboutLabel)
    }

    private func setConstraints() {
        imageView.snp.makeConstraints { (make: ConstraintMaker) in
            make.top.equalToSuperview().offset(5)
            make.width.equalToSuperview().multipliedBy(0.4)
            make.height.equalTo(imageView.snp.width)
            make.centerX.equalToSuperview()
        }

        stackView.snp.makeConstraints { (make: ConstraintMaker) in
            make.top.equalTo(imageView.snp.bottom).offset(5)
            make.trailing.equalToSuperview().offset(8)
            make.leading.equalToSuperview().offset(8)
            make.bottom.equalToSuperview()
        }
    }
}
