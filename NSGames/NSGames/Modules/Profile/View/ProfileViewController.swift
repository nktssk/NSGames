//
//  ProfileViewController.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 08.04.2021.
//

import UIKit
import SnapKit

class ProfileViewController: UIViewController {

    // MARK: - MVVM properties
    var viewModel: ProfileViewModelProtocol?

    // MARK: - UI
    let tableView = UITableView()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Профиль"
        bindData()
        addSubviews()
        setConstraints()
        //tableView.tableHeaderView = ProfileHeaderView()
        tableView.register(AdTableViewCell.self, forCellReuseIdentifier: AdTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
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
extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.items.value.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AdTableViewCell.identifier, for: indexPath) as? AdTableViewCell else { return UITableViewCell() }
        if let ad = viewModel?.items.value[indexPath.row] {
            cell.setData(configuration: ad)
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
