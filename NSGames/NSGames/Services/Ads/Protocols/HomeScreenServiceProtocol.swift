//
//  HomeScreenService.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 15.03.2021.
//

import Foundation

protocol HomeScreenServiceProtocol {
    func getData(completion: @escaping (Result<[AdCollectionViewCellConfig], Error>) -> Void)
    func likeAd(id: Int)
}
