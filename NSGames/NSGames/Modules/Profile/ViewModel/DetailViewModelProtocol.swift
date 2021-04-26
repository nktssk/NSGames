//
//  DetailViewModelProtocol.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 08.04.2021.
//

import Foundation

protocol DetailViewModelProtocol {
    var id: Int { get }
    var title: String { get }
    var items: Observable<[Offer]> { get set }

    func setup()
    func goToChat(id: Int)
    func showTradeList(id: Int)
}

class DetailViewModel: DetailViewModelProtocol {
    var items: Observable<[Offer]> = Observable([])
    let id: Int
    let title: String

    private let service: DetailOfferViewServiceProtocol
    private let coordinator: ProfileCoordinator

    init(service: DetailOfferViewServiceProtocol, coordinator: ProfileCoordinator, id: Int, title: String) {
        self.service = service
        self.coordinator = coordinator
        self.id = id
        self.title = title
    }

    func setup() {
        items.value = [Offer(id: 1, username: "Nikita Sosyuk", price: 1400, tradeListCount: 0, description: "Готов забрать сегодня", chatId: "12345"),
                       Offer(id: 1, username: "Nikita Sosyuk", price: 1400, tradeListCount: 0, description: "Готов забрать сегодня", chatId: "12345"),
                       Offer(id: 1, username: "Nikita Sosyuk", price: 1400, tradeListCount: 0, description: "Готов забрать сегодня", chatId: "12345"),
                       Offer(id: 1, username: "Nikita Sosyuk", price: 1400, tradeListCount: 0, description: "Готов забрать сегодня", chatId: "12345"),
                       Offer(id: 1, username: "Nikita Sosyuk", price: 1400, tradeListCount: nil, description: "Готов забрать сегодня", chatId: "12345"),
                       Offer(id: 1, username: "Nikita Sosyuk", price: 1400, tradeListCount: 3, description: "Готов забрать сегодня", chatId: "12345")]
    }

    func goToChat(id: Int) {
        if let data = items.value.first(where: { $0.id == id }) {
            coordinator.goToChat(messageId: data.chatId, username: data.username)
        }
    }

    func showTradeList(id: Int) {
        if let id = items.value.first(where: { $0.id == id })?.id {
            coordinator.showTradeList(id: id)
        }
    }
}
