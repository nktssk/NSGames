//
//  HomeScreenViewController.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 13.03.2021.
//

import UIKit
import SnapKit

enum HomeScreenViewControllerStyle {
    case favorites
    case home
}

class HomeScreenViewController: UIViewController {

    // MARK: - MVVM properties
    var style: HomeScreenViewControllerStyle = .home
    var viewModel: HomeScreenViewModelProtocol?

    // MARK: - UI
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = HomeScreenCellCollectionConstants.minimumLineSpacing
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        return collectionView
    }()

    let indicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .gray)
        activityIndicator.startAnimating()
        return activityIndicator
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setCollectionView()
        setNavigationBarStyle()
        addSubviews()
        constraints()
        bindData()
        getData()
    }

    // MARK: - Private Methods
    private func setNavigationBarStyle() {
        if style == .favorites {
            title = "Избранное"
        } else {
            title = "Главная"

            let searchController = UISearchController(searchResultsController: nil)
            searchController.obscuresBackgroundDuringPresentation = false
            searchController.searchBar.placeholder = "Поиск"
            navigationItem.searchController = searchController
            navigationItem.hidesSearchBarWhenScrolling = false
            definesPresentationContext = true

            navigationController?.navigationBar.barTintColor = UIColor.grayLight
        }
    }

    private func setCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(HomeScreenCollectionViewCell.self, forCellWithReuseIdentifier: HomeScreenCollectionViewCell.identifier)
        collectionView.contentInset = UIEdgeInsets(top: 14, left: HomeScreenCellCollectionConstants.leftDistance, bottom: 14, right: HomeScreenCellCollectionConstants.rightDistance)
    }

    private func addSubviews() {
        view.addSubview(collectionView)
        view.addSubview(indicator)
    }

    private func constraints() {
        collectionView.snp.makeConstraints { (make: ConstraintMaker) in
            make.top.bottom.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
        }

        indicator.snp.makeConstraints { (make: ConstraintMaker) in
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.centerY.equalTo(view.safeAreaLayoutGuide)
            make.height.width.equalTo(view.snp.width).multipliedBy(0.5)
        }
    }

    private func getData() {
        collectionView.isHidden = true
        indicator.isHidden = false
        viewModel?.getData { [weak self] in
            if let collectionView = self?.collectionView {
                self?.indicator.removeFromSuperview()
                UIView.transition(with: collectionView, duration: 0.6,
                                  options: .transitionCrossDissolve,
                                  animations: {
                                    collectionView.isHidden = false
                                  })
            }
        }
    }

    private func bindData() {
        viewModel?.items.observe(on: self) { [weak self] _ in
            self?.collectionView.reloadData()
        }
        viewModel?.error.observe(on: self) { [weak self] value in
            if let self = self, let value = value {
                AlertPresenter.showAlert(controller: self, text: value)
            }
        }
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
extension HomeScreenViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel?.items.value.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeScreenCollectionViewCell.identifier, for: indexPath) as? HomeScreenCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.delegate = self
        if let data = viewModel?.items.value[indexPath.row] {
            cell.setData(configuration: data)
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height: CGFloat
        if view.frame.height * 0.26 < 190 {
            height = 190
        } else {
            height = view.frame.height * 0.26
        }
        return CGSize(width: HomeScreenCellCollectionConstants.itemWidth, height: height)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel?.detailView(at: indexPath.row)
    }
}

// MARK: - HomeScreenCellDelegate
extension HomeScreenViewController: HomeScreenCellDelegate {
    func likeAd(config: AdCollectionViewCellConfig) {
        viewModel?.likeAd(id: config.id)
    }
}
