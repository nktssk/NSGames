//
//  MockHomeSreenService.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 15.03.2021.
//

import Foundation

class MockHomeScreenService: HomeScreenServiceProtocol {
    func getData(completion: @escaping (Result<[AdCollectionViewCellConfig], Error>) -> Void) {
        let names = ["Call of Duty", "Battlefield", "CS: GO", "Star Wars", "Uncharted 4"]
        var result = [AdCollectionViewCellConfig]()
        result.append(AdCollectionViewCellConfig(id: Int.random(in: 0...999999), image: #imageLiteral(resourceName: "5_big"), name: "Red dead Redemtion 2", isLiked: true, date: Date()))
        for _ in 0...20 {
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
