//
//  SelectGamesServiceProtocol.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 28.03.2021.
//

import Foundation

protocol SelectGamesServiceProtocol {
    func getGamesArray(completion: @escaping (Result<[Game], Error>) -> Void)
}
