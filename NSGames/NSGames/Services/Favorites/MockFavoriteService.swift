//
//  MockFavoriteService.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 13.04.2021.
//

import Foundation

class MockFavoriteService: HomeScreenServiceProtocol {
    func getData(completion: @escaping (Result<[AdCollectionViewCellConfig], Error>) -> Void) {
        let names = ["Call of Duty"]
        var result = [AdCollectionViewCellConfig]()
        for _ in 0...1 {
            let name = names[Int.random(in: 0..<names.count)]
            var date = Date()
            date.addTimeInterval(TimeInterval(Int.random(in: -295000...0)))
            let isLiked = Bool.random()
            result.append(AdCollectionViewCellConfig(id: Int.random(in: 0...999999), image: #imageLiteral(resourceName: "NSGames-icon"), name: name, isLiked: isLiked, date: date))
        }
        completion(.success(result))
    }

    func likeAd(id: Int) {
        print("LIKE")
    }
}
