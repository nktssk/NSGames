//
//  ProfileError.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 29.04.2021.
//

import Foundation

enum ProfileServiceError: Error {
    case noConnection
    case badRequest
    case notEncodable
    case wrongData
}
