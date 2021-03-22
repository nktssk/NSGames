//
//  ForgotPasswordViewModel.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 17.03.2021.
//

import Foundation

protocol ForgotPasswordViewModel {
    var onNextScreen: (() -> Void)? { get set }
    var emailError: Observable<String?> { get set }

    func checkEmail(email: String)
}

class MockForgotPasswordViewModel: ForgotPasswordViewModel {
    var onNextScreen: (() -> Void)?

    var emailError: Observable<String?> = Observable(nil)

    var forgotPasswordService: ForgotPasswordService

    init(service: ForgotPasswordService) {
        forgotPasswordService = service
    }

    func checkEmail(email: String) {
        if email.isEmpty {
            emailError.value = "Введите данные."
        } else {
            forgotPasswordService.checkEmail(email: email) { [weak self] result in
                switch result {
                case .success:
                    self?.onNextScreen?()

                case .failure(let error):
                    switch error {
                    case .wrongEmail:
                        self?.emailError.value = "Пользователя не существует."
                    }
                }
            }
        }
    }
}
