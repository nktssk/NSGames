//
//  Game.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 28.03.2021.
//

import Foundation

struct GameSreenConfig {
    let title: String
    let description: String
    let messageId: String
    let price: Int
    let date: Date
    let profile: Profile
}

struct Profile {
    let id: Int
    let username: String
}
