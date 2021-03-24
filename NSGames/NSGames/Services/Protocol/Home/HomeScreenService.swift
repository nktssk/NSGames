//
//  HomeScreenService.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 15.03.2021.
//

import Foundation

protocol HomeScreenService {
    func getData(completion: (Result<[HomeScreenCellConfig], Error>) -> Void)
    func likeAd(id: Int)
}
