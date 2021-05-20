//
//  AuthRequestPath.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 08.04.2021.
//

import Foundation

enum AuthRequestPath {
    static let singIn = BaseUrl.host + "/signIn"
    static let singUp = BaseUrl.host + "/signUp"
    static let forgotPassword = BaseUrl.host + "/forgotPassword/sendEmail"
    static let changePassword = BaseUrl.host + "/forgotPassword/changePassword"
}

enum ResponseBodyPropertyName {
    static let code = "code"
    static let email = "email"
    static let password = "password"
    static let username = "username"
}

struct SignInResponse: Decodable {
    let user: User
    let token: String
}

struct User: Decodable {
    let email: String
    let chatId: String
    let username: String
}
