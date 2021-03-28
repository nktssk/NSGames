//
//  GamePageViewController.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 21.03.2021.
//

import UIKit
import SnapKit

class GameViewController: UIViewController {

    // MARK: - MVVM properties
    var viewModel: GameViewModelProtocol?

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

    let staticDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Описание: "
        label.numberOfLines = 1
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()

    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()

    let parameterStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()

    let staticStateLabel: GrayLabel = {
        let label = GrayLabel()
        label.text = "Состояние"
        return label
    }()

    let dateLabel = GrayLabel()

    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.bounces = true
        return scrollView
    }()

    // MARK: - Properties
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh MMM"
        return formatter
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Объявление"
        bindData()
        setCollectionView()
        setPageControl()
        addSubviews()
        setConstraints()
        viewModel?.getData()
    }

    override func viewDidLayoutSubviews() {
        scrollView.contentSize = CGSize(width: view.frame.width, height: imageSlider.frame.height + stackView.frame.height + readyButton.frame.height + dateLabel.frame.height + 10)
    }

    // MARK: - Objc Methods
    @objc private func readyButtonAction() {
        viewModel?.makeOffer()
        UIView.transition(with: readyButton, duration: 0.3,
                          options: .transitionCrossDissolve,
                          animations: { [weak self] in
                            self?.readyButton.backgroundColor = UIColor.greenButton
                            self?.readyButton.setTitle("Предложение отправлено.", for: .normal)
                          })
    }

    // MARK: - Private Methods
    private func setConstraints() {
        scrollView.snp.makeConstraints { (make: ConstraintMaker) in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }

        imageSlider.snp.makeConstraints { (make: ConstraintMaker) in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.4)
        }

        pageControl.snp.makeConstraints { (make: ConstraintMaker) in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(imageSlider.snp.bottom).inset(4)
            make.height.equalTo(8)
        }

        readyButton.snp.makeConstraints { (make: ConstraintMaker) in
            make.height.equalTo(45)
        }

        stackView.snp.makeConstraints { (make: ConstraintMaker) in
            make.top.equalTo(imageSlider.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.9)
        }

        dateLabel.snp.makeConstraints { (make: ConstraintMaker) in
            make.top.equalTo(stackView.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
    }

    private func addSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(imageSlider)
        scrollView.addSubview(pageControl)
        stackView.addArrangedSubview(gameNameLabel)
        stackView.addArrangedSubview(priceLabel)
        stackView.addArrangedSubview(readyButton)
        stackView.addArrangedSubview(staticDescriptionLabel)
        stackView.addArrangedSubview(descriptionLabel)
        scrollView.addSubview(stackView)
        scrollView.addSubview(dateLabel)
    }

    private func setCollectionView() {
        imageSlider.delegate = self
        imageSlider.dataSource = self
        imageSlider.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: ImageCollectionViewCell.identifier)
    }

    private func setPageControl() {
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = .grayLight
        pageControl.currentPageIndicatorTintColor = .buttonBlue
        pageControl.alpha = 0.6
    }

    private func bindData() {
        viewModel?.imageItems.observe(on: self) { [weak self] values in
            self?.pageControl.numberOfPages = values.count
            self?.imageSlider.reloadData()
        }
        viewModel?.game.observe(on: self) { [weak self] game in
            if let game = game {
                self?.priceLabel.text = "\(game.price) ₽"
                self?.dateLabel.text = self?.dateFormatter.string(from: Date())
                self?.descriptionLabel.text = game.description
                self?.gameNameLabel.text = game.title
            }
        }
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
extension GameViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel?.imageItems.value.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.identifier, for: indexPath) as? ImageCollectionViewCell else {
            return UICollectionViewCell()
        }
        if let imageFromViewModel = viewModel?.imageItems.value[indexPath.row] {
            cell.setImage(image: imageFromViewModel)
        }
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
