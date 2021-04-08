//
//  GameService.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 24.03.2021.
//

import UIKit

protocol GameServiceProtocol {
    func getStringData(id: Int, completion: @escaping (Result<GameSreenConfig, Error>) -> Void)
    func getImages(id: Int, completion: @escaping (Result<[UIImage], Error>) -> Void)
}
