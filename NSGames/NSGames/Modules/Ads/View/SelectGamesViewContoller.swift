//
//  SelectGamesViewContoller.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 22.03.2021.
//

import UIKit
import SnapKit

class SelectGamesViewContoller: UIViewController {

    // MARK: - MVVM properties
    var viewModel: SelectGamesViewModel?

    // MARK: - UI
    let tableView = UITableView()
    private let searchController = UISearchController(searchResultsController: nil)

    // MARK: - Propertie
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }

    private var isFiltering: Bool {
        return searchController.isActive && !searchBarIsEmpty
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Выберите игры"
        setNavigationBarStyle()
        bindData()
        addSubviews()
        setConstraints()
        tableView.register(SelectGameTableViewCell.self, forCellReuseIdentifier: SelectGameTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        viewModel?.getData()
    }

    // MARK: - Objc Methods
    @objc func doneButtonAction() {
        viewModel?.done()
    }

    // MARK: - Private Methods
    private func addSubviews() {
        view.addSubview(tableView)
    }

    private func bindData() {
        viewModel?.games.observe(on: self) { [weak self] _ in
            self?.tableView.reloadData()
        }
    }

    private func setConstraints() {
        tableView.snp.makeConstraints { (make: ConstraintMaker) in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }

    private func setNavigationBarStyle() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Поиск"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonAction))
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension SelectGamesViewContoller: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.isFiltering = isFiltering
        return viewModel?.games.value.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SelectGameTableViewCell.identifier, for: indexPath)
        viewModel?.isFiltering = isFiltering
        if let game = viewModel?.games.value[indexPath.row] {
            if let viewModel = viewModel, viewModel.setCheckMark(index: indexPath.row) {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
            cell.textLabel?.text = game.name
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel?.isFiltering = isFiltering
        viewModel?.selectGame(index: indexPath.row)
        if let cell = tableView.cellForRow(at: indexPath) as? SelectGameTableViewCell {
            cell.isCheckMark = !cell.isCheckMark
        }
    }
}

// MARK: - UISearchResultsUpdating
extension SelectGamesViewContoller: UISearchResultsUpdating {

    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }

    private func filterContentForSearchText(_ searchText: String) {
        if !searchText.isEmpty {
            viewModel?.filter(searchText)
        }
    }
}
