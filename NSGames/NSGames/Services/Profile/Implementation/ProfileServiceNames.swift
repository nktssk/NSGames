//
//  ProfileServiceNames.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 29.04.2021.
//

import Foundation

enum ProfileRequestPath {
    static let ads = "http://localhost/user/ads"
    static let detail = "http://localhost/ad/offers"
    static let delete = "http://localhost/ad/delete"
}

struct ProfileAdDto: Codable {
    let id: Int
    let title: String
    let description: String
    let price: Double
    // let date: Date
    let countTradeGames: Int
    let countOffers: Int
    let countViews: Int
    let firstPhoto: String
}

struct DetailOfferDto: Codable {
    let id: Int
    let price: Double?
    let chatId: String
    let name: String
    let description: String
    let countOfTradeList: Int?
}
