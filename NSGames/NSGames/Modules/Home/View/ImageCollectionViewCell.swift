//
//  ImageCollectionViewCell.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 21.03.2021.
//

import UIKit
import SnapKit

class ImageCollectionViewCell: UICollectionViewCell {

    static let identifier = "ImageCollectionViewCell"

    // MARK: - UI
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
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

    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }

    func setImage(image: UIImage) {
        imageView.image = image
    }

    // MARK: - Private Methods
    private func setConstraints() {
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints { (make: ConstraintMaker) in
            make.edges.equalToSuperview()
        }
    }
}
