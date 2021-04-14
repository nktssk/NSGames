//
//  CreateAdViewModel.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 13.04.2021.
//

import UIKit

protocol CreateAdViewModelProtocol {
    var imageItems: Observable<[UIImage]> { get set }
    var error: Observable<String?> { get set }
    var selectedGames: Observable<[Int]> { get set }

    func didLoad()
    func addImage(image: UIImage)
    func deleteImage(index: Int)
    func sendData(name: String?, price: String?, description: String)
    func selectGames()
}

class CreateAdViewModel: CreateAdViewModelProtocol {

    // MARK: - Properties
    var imageItems: Observable<[UIImage]> = Observable([])
    var selectedGames: Observable<[Int]> = Observable([])
    var error: Observable<String?> = Observable(nil)

    private var hadNewImage = false
    private let service: GameServiceProtocol
    private let coordinator: CreateAdCoordinatorProtocol

    init(service: GameServiceProtocol, coordinator: CreateAdCoordinatorProtocol) {
        self.service = service
        self.coordinator = coordinator
    }

    func didLoad() {
        setNoImage()
    }

    func addImage(image: UIImage) {
        if !hadNewImage {
            hadNewImage = true
            imageItems.value.removeAll()
        }
        imageItems.value.append(image)
    }

    func setNoImage() {
        if imageItems.value.isEmpty, let image = UIImage(named: "noImage") {
            imageItems.value = [image]
        }
    }

    func deleteImage(index: Int) {
        imageItems.value.remove(at: index)
        setNoImage()
    }

    func sendData(name: String, price: String?, description: String) {
        // TODO: - service
    }

    func sendData(name: String?, price: String?, description: String) {
        if name == nil {
            return error.value = "Нужно заполнить название игры"
        }
        if description.isEmpty {
            return error.value = "Нужно заполнить описание"
        }
        if price == nil || selectedGames.value.isEmpty {
            return error.value = "Нужно выбрать игры для обмена или написать цену игры"
        }
        if !hadNewImage {
            return error.value = "Нужна хотя бы одна фотография для объявления"
        }
        // TODO: - service
        imageItems.value = []
        selectedGames.value = []
    }

    func selectGames() {
        coordinator.goToSelectGamesView(games: selectedGames.value)
    }
}
