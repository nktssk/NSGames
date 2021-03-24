//
//  ForgotPasswordService.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 17.03.2021.
//

import Foundation

protocol ForgotPasswordService {
    func checkEmail(email: String, completion: @escaping (Result<(), ForgotPasswordError>) -> Void)
}
