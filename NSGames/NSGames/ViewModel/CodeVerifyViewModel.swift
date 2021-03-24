//
//  CodeVerifyViewModel.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 10.03.2021.
//

import Foundation

protocol CodeVerifyViewModel {
    var codeVerifyError: ObservableUI<String?> { get set }
    var coordinator: AuthenticationCoordinator { get set }

    func checkCode(code: String)
}

class MockCodeVerifyViewModel: CodeVerifyViewModel {
    var codeVerifyService: CodeVerifyService
    var coordinator: AuthenticationCoordinator

    init(service: CodeVerifyService, coordinator: AuthenticationCoordinator) {
        self.codeVerifyService = service
        self.coordinator = coordinator
    }

    var codeVerifyError: ObservableUI<String?> = ObservableUI(nil)

    // MARK: - CodeVerifyViewModel
    func checkCode(code: String) {
        if code.isEmpty {
            return codeVerifyError.value = "Пожалуйста, введите код"
        }
        codeVerifyService.checkCode(code: code) { [weak self] result in
            switch result {
            case .success:
                self?.coordinator.authFinished()

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
