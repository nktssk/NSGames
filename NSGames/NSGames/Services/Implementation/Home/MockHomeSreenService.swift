//
//  MockHomeSreenService.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 15.03.2021.
//

import Foundation

class MockHomeScreenService: HomeScreenService {
    func getData(completion: (Result<[HomeScreenCellConfig], Error>) -> Void) {
        let names = ["Call of Duty", "Battlefield", "CS: GO", "Star Wars", "Uncharted 4"]
        var result = [HomeScreenCellConfig]()
        for _ in 0...20 {
            let name = names[Int.random(in: 0..<names.count)]
            var date = Date()
            date.addTimeInterval(TimeInterval(Int.random(in: -295000...0)))
            let isLiked = Bool.random()
            result.append(HomeScreenCellConfig(id: Int.random(in: 0...999999), image: #imageLiteral(resourceName: "NSGames-icon"), name: name, isLiked: isLiked, date: date))
        }
        completion(.success(result))
    }

    func getData() {
        let names = ["Call of Duty", "Battlefield", "CS: GO", "Star Wars", "Uncharted 4"]
        var result = [HomeScreenCellConfig]()
        for _ in 0...20 {
            let name = names[Int.random(in: 0..<names.count)]
            var date = Date()
            date.addTimeInterval(TimeInterval(Int.random(in: -295000...0)))
            let isLiked = Bool.random()
            result.append(HomeScreenCellConfig(id: Int.random(in: 0...999999), image: #imageLiteral(resourceName: "NSGames-icon"), name: name, isLiked: isLiked, date: date))
        }
    }

    func likeAd(id: Int) {
        print("LIKE")
    }
}
