//
//  DetailOfferViewService.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 09.04.2021.
//

import Foundation

class DetailOfferViewService: DetailOfferViewServiceProtocol {
    func getOffers(id: Int, completion: @escaping (Result<[Offer], Error>) -> Void) {
        return completion(.success([Offer(id: 1, username: "Pasandep", price: 123, tradeListCount: 0, description: "Могу забрать сегодня", chatId: "12345")]))
    }
}
