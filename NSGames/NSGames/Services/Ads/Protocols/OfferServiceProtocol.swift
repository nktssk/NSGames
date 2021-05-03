//
//  OfferService.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 24.03.2021.
//

import Foundation

protocol OfferServiceProtocol {
    func sendOffer(offer: OfferDto, completion: @escaping (Result<Void, AdServiceError>) -> Void)
}
