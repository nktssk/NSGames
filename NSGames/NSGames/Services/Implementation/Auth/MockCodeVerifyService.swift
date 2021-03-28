//
//  MockCodeVerifyService.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 17.03.2021.
//

import Foundation

class MockCodeVerifyService: CodeVerifyServiceProtocol {
    func checkCode(code: String, completion: @escaping (Result<(), CodeVerifyError>) -> Void) {
        if code == "LOLOLO" {
            return completion(.success(()))
        }
        if code == "OLOLOL" {
            return completion(.failure(.codeNotCorrect))
        }
        return completion(.failure(.noConnection))
    }
}
