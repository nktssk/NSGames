//
//  ProfileServiceNames.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 29.04.2021.
//

import Foundation

enum ProfileRequestPath {
    static let ads = "http://192.168.0.100:80/user/ads"
    static let userInfo = "http://192.168.0.100:80/user/info"
    static let detail = "http://192.168.0.100:80/ad/offers"
    static let delete = "http://192.168.0.100:80/ad/delete"
    static let logout = "http://192.168.0.100:80/user/logout"
}

struct ProfileAdDto: Codable {
    let id: Int
    let title: String
    let description: String
    let price: Double
    let date: Date
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
