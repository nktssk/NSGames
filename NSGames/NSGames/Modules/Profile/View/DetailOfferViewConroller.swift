//
//  DetailOfferViewConroller.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 08.04.2021.
//

import UIKit
import SnapKit

class DetailOfferViewConroller: UIViewController {

    // MARK: - MVVM properties
    var viewModel: DetailViewModelProtocol?

    // MARK: - UI
    let tableView = UITableView()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel?.title
        bindData()
        addSubviews()
        setConstraints()
        tableView.register(OfferDetailTableViewCell.self, forCellReuseIdentifier: OfferDetailTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        viewModel?.setup()
    }

    // MARK: - Private Methods
    private func addSubviews() {
        view.addSubview(tableView)
    }

    private func bindData() {
        viewModel?.items.observe(on: self) { [weak self] _ in
            self?.tableView.reloadData()
        }
    }

    private func setConstraints() {
        tableView.snp.makeConstraints { (make: ConstraintMaker) in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension DetailOfferViewConroller: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.items.value.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: OfferDetailTableViewCell.identifier, for: indexPath) as? OfferDetailTableViewCell else { return UITableViewCell() }
        if let ad = viewModel?.items.value[indexPath.row] {
            cell.setData(configuration: ad)
            cell.delegate = self
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - OfferDetailTableViewCellDelegate
extension DetailOfferViewConroller: OfferDetailTableViewCellDelegate {
    func goToChat(id: Int) {
        viewModel?.goToChat(id: id)
    }

    func showTradeList(id: Int) {
        viewModel?.showTradeList(id: id)
    }
}
