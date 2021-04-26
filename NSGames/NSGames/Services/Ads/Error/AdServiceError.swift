//
//  AdServiceError.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 25.04.2021.
//

import Foundation

enum AdServiceError: Error {
    case noConnection
    case badRequest
    case notEncodable
    case wrongData
}
