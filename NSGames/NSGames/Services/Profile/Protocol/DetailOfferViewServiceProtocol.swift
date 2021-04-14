//
//  DetailOfferViewServiceProtocol.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 09.04.2021.
//

import Foundation

protocol DetailOfferViewServiceProtocol {
    func getOffers(id: Int, completion: @escaping (Result<[Offer], Error>) -> Void)
}
