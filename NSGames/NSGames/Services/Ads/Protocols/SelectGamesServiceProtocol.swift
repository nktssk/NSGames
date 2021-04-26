//
//  SelectGamesServiceProtocol.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 28.03.2021.
//

import Foundation

protocol SelectGamesServiceProtocol {
    func getGamesArray(id: Int, completion: @escaping (Result<[Game], AdServiceError>) -> Void)
    func getAllGames(completion: @escaping (Result<[Game], AdServiceError>) -> Void)
}
