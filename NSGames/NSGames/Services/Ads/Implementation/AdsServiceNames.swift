//
//  AdsServiceNames.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 25.04.2021.
//

import Foundation

enum AdsRequestPath {
    static let feed = "http://192.168.0.100:80/ad/feed"
    static let like = "http://192.168.0.100:80/ad/like"
    static let detail = "http://192.168.0.100:80/ad/detail"
    static let search = "http://192.168.0.100:80/ad/search/"
    static let tradeList = "http://192.168.0.100:80/ad/tradeList/"
    static let offerTradeList = "http://192.168.0.100:80/ad/offerGameList/"
    static let allGameList = "http://192.168.0.100:80/game/getAll"
    static let favorites = "http://192.168.0.100:80/ad/favorites"
    static let offer = "http://192.168.0.100:80/ad/createOffer"
}

struct AdFeedDto: Codable {
    let id: Int
    let liked: Bool
    let name: String
    let date: Date
    let photoName: String
}

struct AdDetailDto: Codable {
    let id: Int
    let title: String
    let description: String
    let price: Double
    let date: Date
    let username: String
    let chatId: String
    let countTradeGames: Int
    let countViews: Int
    let photoNames: [String]
}

struct GameDto: Codable {
    let id: Int
    let name: String
}

struct OfferDto: Codable {
    let adId: Int
    let price: Double?
    let tradeList: [Int]
    let description: String
}
