//
//  CodeVerifyViewModel.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 10.03.2021.
//

import Foundation

protocol CodeVerifyViewModel {
    var onSuccesReg: (() -> Void)? { get set }
    var codeVerifyError: Observable<String?> { get set }

    func checkCode(code: String)
}

class MockCodeVerifyViewModel: CodeVerifyViewModel {
    var codeVerifyService: CodeVerifyService

    init(service: CodeVerifyService) {
        codeVerifyService = service
    }

    // MARK: - Business logic properties
    var onSuccesReg: (() -> Void)?

    var codeVerifyError: Observable<String?> = Observable(nil)

    // MARK: - CodeVerifyViewModel
    func checkCode(code: String) {
        if code.isEmpty {
            return codeVerifyError.value = "Пожалуйста, введите код"
        }
        codeVerifyService.checkCode(code: code) { [weak self] result in
            switch result {
            case .success:
                self?.onSuccesReg?()

            case .failure(let error):
                switch error {
                case .noConnection:
                    self?.codeVerifyError.value = "Нет соединения."

                case .codeNotCorrect:
                    self?.codeVerifyError.value = "Код введен некорректно."
                }
            }
        }
    }
}
