//
//  ProfileServiceNames.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 29.04.2021.
//

import Foundation

enum ProfileRequestPath {
    static let ads = "http://localhost/user/ads"
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
