//
//  HomeScreenCellConfiguration.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 14.03.2021.
//

import UIKit

struct AdCollectionViewCellConfig: Equatable {
    let id: Int
    let image: String
    let name: String
    let date: Date
    var isLiked: Bool

    static func == (first: AdCollectionViewCellConfig, second: AdCollectionViewCellConfig) -> Bool {
        return first.id == second.id
    }
}
