//
//  AuthenticationError.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 24.05.2021.
//

import Foundation

enum SignInError: Error {
    case wrongData
    case noConnection
    case badRequest
}

enum SignUpError: Error {
    case emailIsOccupied
    case noConnection
    case badRequest
}

enum ForgotPasswordError: Error {
    case noConnection
    case wrongEmail
    case badRequest
}

enum CodeVerifyError: Error {
    case codeNotCorrect
    case noConnection
    case badRequest
}
