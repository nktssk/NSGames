//
//  HomeScreenViewController.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 13.03.2021.
//

import UIKit
import SnapKit

class HomeScreenViewController: UIViewController {

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

    var viewModel = MockHomeScreenViewModel(service: MockHomeScreenService())
    private var data = [HomeScreenCellConfig]()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setCollectionView()
        setNavigationBarStyle()
        setTabBarStyle()
        constraints()
        getData()
    }

    // MARK: - Objc Methods
    @objc private func profileButtonAction() {
        print("lol")
    }

    // MARK: - Private Methods
    private func setNavigationBarStyle() {
        title = "NSGames"

        let searchController = UISearchController(searchResultsController: nil)
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        definesPresentationContext = true

        navigationController?.navigationBar.barTintColor = UIColor.grayLight
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    private func setCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(HomeScreenCollectionViewCell.self, forCellWithReuseIdentifier: HomeScreenCollectionViewCell.identifier)
        collectionView.contentInset = UIEdgeInsets(top: 14, left: HomeScreenCellCollectionConstants.leftDistance, bottom: 14, right: HomeScreenCellCollectionConstants.rightDistance)
    }

    private func constraints() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make: ConstraintMaker) in
            make.top.bottom.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
        }

        view.addSubview(indicator)
        indicator.snp.makeConstraints { (make: ConstraintMaker) in
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.centerY.equalTo(view.safeAreaLayoutGuide)
            make.height.width.equalTo(view.snp.width).multipliedBy(0.5)
        }
    }

    private func setTabBarStyle() {
        tabBarItem = UITabBarItem(title: "Главная", image: UIImage(named: "house.fill"), tag: 0)
    }

    private func getData() {
        collectionView.isHidden = true
        indicator.isHidden = false
        viewModel.getData { [weak self] result in
            switch result {
            case .success(let newData):
                self?.data += newData
                self?.indicator.isHidden = true
                if let collectionView = self?.collectionView {
                    UIView.transition(with: collectionView, duration: 0.6,
                                      options: .transitionCrossDissolve,
                                      animations: {
                                        collectionView.isHidden = false
                                      })
                }
                self?.collectionView.reloadData()

            case .failure:
                print("lolol")
            }
        }
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
extension HomeScreenViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeScreenCollectionViewCell.identifier, for: indexPath) as? HomeScreenCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.delegate = self
        cell.setData(configuration: data[indexPath.row])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height: CGFloat
        if view.frame.height * 0.25 < 170 {
            height = 170
        } else {
            height = view.frame.height * 0.25
        }
        return CGSize(width: HomeScreenCellCollectionConstants.itemWidth, height: height)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        #warning(Coordinator)
    }
}

extension HomeScreenViewController: HomeScreenCellDelegate {
    func likeAd(config: HomeScreenCellConfig) {
        if let index = data.firstIndex(where: { $0.id == config.id }) {
            data[index] = config
        }
        viewModel.likeAd(id: config.id)
    }
}
