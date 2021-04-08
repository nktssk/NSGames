//
//  ForgotPasswordError.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 17.03.2021.
//

import Foundation

enum ForgotPasswordError: Error {
    case noConnection
    case wrongEmail
    case badRequest
}
