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
    let tableView = UITableView(frame: CGRect.zero, style: .grouped)
    let header = ProfileHeaderView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 5))

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Профиль"
        bindData()
        addSubviews()
        setConstraints()
        tableView.separatorStyle = .none
        tableView.tableHeaderView = header
        tableView.register(AdTableViewCell.self, forCellReuseIdentifier: AdTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        viewModel?.setup()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Выйти", style: .done, target: self, action: #selector(exitButtonAction))
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        viewModel?.setup()
    }

    // MARK: - Objc Methods
    @objc func exitButtonAction() {
        viewModel?.quit()
    }

    // MARK: - Private Methods
    private func addSubviews() {
        view.addSubview(tableView)
    }

    private func bindData() {
        viewModel?.items.observe(on: self) { [weak self] _ in
            self?.tableView.reloadData()
        }
        viewModel?.userInfo.observe(on: self) { [weak self] value in
            if let data = value {
                self?.header.setInfo(data: data)
            }
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

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Объявления"
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AdTableViewCell.identifier, for: indexPath) as? AdTableViewCell else { return UITableViewCell() }
        if let ad = viewModel?.items.value[indexPath.row] {
            cell.setData(configuration: ad)
        }
        cell.backgroundColor = tableView.backgroundColor
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        guard let cell = tableView.cellForRow(at: indexPath) as? AdTableViewCell else { return }
        cell.backView.snp.removeConstraints()
        cell.backView.snp.makeConstraints { (make: ConstraintMaker) in
            make.edges.equalToSuperview()
        }

        UIView.animate(withDuration: 1,
                       delay: 0,
                       usingSpringWithDamping: 1,
                       initialSpringVelocity: 10,
                       options: [.curveEaseInOut],
                       animations: { [unowned cell] in
                        cell.layoutIfNeeded()
                        cell.backView.layer.cornerRadius = 0
                       },
                       completion: { [weak cell, viewModel] _ in
                        cell?.backView.snp.removeConstraints()
                        cell?.backView.snp.makeConstraints { (make: ConstraintMaker) in
                            make.top.left.equalToSuperview().offset(10)
                            make.bottom.right.equalToSuperview().inset(10)
                        }
                        UIView.animate(withDuration: 0.2,
                                       delay: 0,
                                       usingSpringWithDamping: 1,
                                       initialSpringVelocity: 10,
                                       options: .curveEaseInOut,
                                       animations: {
                                        cell?.backView.layer.cornerRadius = 14
                                        cell?.layoutIfNeeded()
                                       },
                                       completion: { _ in
                                        viewModel?.didSelectItem(at: indexPath.row)
                                       })
                       })
    }
}
