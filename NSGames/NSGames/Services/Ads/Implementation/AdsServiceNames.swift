//
//  AdsServiceNames.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 25.04.2021.
//

import Foundation

enum AdsRequestPath {
    static let feed = "http://localhost/ad/feed"
    static let like = "http://localhost/ad/like"
    static let detail = "http://localhost/ad/detail"
    static let tradeList = "http://localhost/ad/tradeList/"
    static let allGameList = "http://localhost/game/getAll"
}

struct AdFeedDto: Codable {
    let id: Int
    let liked: Bool
    let name: String
//    let date: Date
    let photoName: String
}

struct AdDetailDto: Codable {
    let id: Int
    let title: String
    let description: String
    let price: Double
    // let date: Date
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
