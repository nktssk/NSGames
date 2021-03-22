//
//  GamePageViewController.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 21.03.2021.
//

import UIKit
import SnapKit

class GamePageViewController: UIViewController {

    // MARK: - MVVM properties
    var viewModel: SignInViewModel?

    // MARK: - UI
    let imageSlider: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        return collectionView
    }()

    let pageControl = UIPageControl()

    let gameNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        label.numberOfLines = 3
        return label
    }()

    let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.numberOfLines = 3
        return label
    }()

    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()

    let readyButton: BlueButton = {
        let button = BlueButton()
        button.setTitle("Готов купить!", for: .normal)
        button.addTarget(self, action: #selector(readyButtonAction), for: .touchUpInside)
        return button
    }()

    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()

    let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .grayLabel
        return label
    }()

    let staticDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Описание: "
        label.numberOfLines = 1
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()

    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.bounces = true
        return scrollView
    }()

    private let images: [UIImage] = [#imageLiteral(resourceName: "NSGames-icon"), #imageLiteral(resourceName: "NSGames-icon"), #imageLiteral(resourceName: "NSGames-icon"), #imageLiteral(resourceName: "NSGames-icon"), #imageLiteral(resourceName: "NSGames-icon")]

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Игра"
        setData()
        setCollectionView()
        setPageControl()
        setConstraints()
    }

    override func viewDidLayoutSubviews() {
        let height = imageSlider.frame.height + stackView.frame.height + readyButton.frame.height + dateLabel.frame.height + 10
        scrollView.contentSize = CGSize(width: view.frame.width, height: height)
    }

    // MARK: - Objc Methods
    @objc private func readyButtonAction() {
        UIView.transition(with: readyButton, duration: 0.3,
                          options: .transitionCrossDissolve,
                          animations: { [weak self] in
                            self?.readyButton.backgroundColor = UIColor.greenButton
                            self?.readyButton.setTitle("Предложение отправлено.", for: .normal)
                          })
        #warning(viewModel)
    }

    // MARK: - Helpers
    private func setConstraints() {
        view.addSubview(scrollView)

        scrollView.snp.makeConstraints { (make: ConstraintMaker) in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }

        scrollView.addSubview(imageSlider)
        imageSlider.snp.makeConstraints { (make: ConstraintMaker) in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.4)
        }

        scrollView.addSubview(pageControl)
        pageControl.snp.makeConstraints { (make: ConstraintMaker) in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(imageSlider.snp.bottom)
            make.height.equalTo(8)
        }

        stackView.addArrangedSubview(gameNameLabel)
        stackView.addArrangedSubview(priceLabel)
        stackView.addArrangedSubview(readyButton)
        stackView.addArrangedSubview(staticDescriptionLabel)
        stackView.addArrangedSubview(descriptionLabel)
        readyButton.snp.makeConstraints { (make: ConstraintMaker) in
            make.height.equalTo(45)
        }
        scrollView.addSubview(stackView)
        stackView.snp.makeConstraints { (make: ConstraintMaker) in
            make.top.equalTo(imageSlider.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.9)
        }

        scrollView.addSubview(dateLabel)
        dateLabel.snp.makeConstraints { (make: ConstraintMaker) in
            make.top.equalTo(stackView.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
    }

    private func setCollectionView() {
        imageSlider.delegate = self
        imageSlider.dataSource = self
        imageSlider.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: ImageCollectionViewCell.identifier)
    }

    private func setPageControl() {
        pageControl.numberOfPages = images.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = .grayLight
        pageControl.currentPageIndicatorTintColor = .buttonBlue
        pageControl.alpha = 0.6
    }

    private func setData() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh MMM"
        priceLabel.text = "2999" + " ₽"
        dateLabel.text = dateFormatter.string(from: Date())
        descriptionLabel.text = "Добрый день! \n Мы зaнимаeмcя продажей цифpовыx веpcий игp для кoнcолeй Хbox One! \n Пoкупая у нас вы получаeтe: \n 1) Выгoдные цeны на игры и подписки Gаmе pass, Livе Gold, Gаmе рass Ultimatе для вaшей конcоли. \n 2) Cтабильную теxничeскую пoддepжку на периoд иcпользовaния товaрa. \n 3) Вoзможность дoбaвитьcя в нaшу  группу в вк и веceлo пообщаться, получить последние новости в сфере гейминга. \n \n RDR 2 ХВОХ ОNе цифровой ключ."
        gameNameLabel.text = "Red Dead Redemtion 2"
    }
}

extension GamePageViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        images.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.identifier, for: indexPath) as? ImageCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.setImage(image: images[indexPath.row])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return imageSlider.frame.size
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == imageSlider {
            pageControl.currentPage = Int(scrollView.contentOffset.x / imageSlider.frame.size.width)
        }
    }
}
