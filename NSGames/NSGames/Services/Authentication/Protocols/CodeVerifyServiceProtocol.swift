//
//  CodeVerifyService.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 10.03.2021.
//

import Foundation

protocol CodeVerifyServiceProtocol {
    func checkCode(code: String, completion: @escaping (Result<(), CodeVerifyError>) -> Void)
}
