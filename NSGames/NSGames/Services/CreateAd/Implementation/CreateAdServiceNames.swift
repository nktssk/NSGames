//
//  CreateAdServiceNames.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 18.04.2021.
//

import Foundation

enum CreateAdPath {
    static let createAd = "http://localhost/ad/create"
    static let uploadPhoto = "http://localhost/ad/uploadPhoto/"
}

enum CreateAdResponseBodyPropertyName {
    static let games = "games"
    static let photos = "photos"
}

struct AdForm: Encodable {
    let title: String
    let price: Double?
    let description: String
    let games: [Int]?
}
