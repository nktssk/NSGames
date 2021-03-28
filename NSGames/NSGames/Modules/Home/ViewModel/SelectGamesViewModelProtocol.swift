//
//  SelectGamesViewModek.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 28.03.2021.
//

import Foundation

protocol SelectGamesViewModelProtocol {
    var games: Observable<[Game]> { get set }
    var isFiltering: Bool { get set }

    func filter(_ string: String)
    func selectGame(index: Int)
    func setCheckMark(index: Int) -> Bool
}

class SelectGamesViewModel: SelectGamesViewModelProtocol {
    var games: Observable<[Game]> = Observable([])
    var isFiltering = false
    var selected = [Int]()

    private let coordinator: HomeCoordinator
    private let service: SelectGamesServiceProtocol
    private let id: Int
    private var allGamesList = [Game]()
    private var filteredGames = [Game]()

    init(service: SelectGamesServiceProtocol, coordinator: HomeCoordinator, id: Int) {
        self.service = service
        self.coordinator = coordinator
        self.id = id
    }

    func getData() {
        service.getGamesArray { [weak self] result in
            switch result {
            case .success(let array):
                self?.allGamesList = array
                self?.games.value = array

            case .failure:
                // TODO: - error
                print("error")
            }
        }
    }

    func selectGame(index: Int) {
        let game: Game
        if isFiltering {
            game = filteredGames[index]
        } else {
            game = allGamesList[index]
        }
        if let index = selected.firstIndex(where: { $0 == game.id }) {
            selected.remove(at: index)
        } else {
            selected.append(game.id)
        }
    }

    func filter(_ string: String) {
        filteredGames = allGamesList.filter({ $0.name.lowercased().contains(string.lowercased()) })
        games.value = filteredGames
    }

    func setCheckMark(index: Int) -> Bool {
        if isFiltering {
            let game = filteredGames[index]
            if selected.first(where: { $0 == game.id }) != nil {
                return true
            } else {
                return false
            }
        } else {
            let game = allGamesList[index]
            if selected.first(where: { $0 == game.id }) != nil {
                return true
            } else {
                return false
            }
        }
    }
}
