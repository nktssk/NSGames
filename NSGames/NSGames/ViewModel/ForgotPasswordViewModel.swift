//
//  ForgotPasswordViewModel.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 17.03.2021.
//

import Foundation

protocol ForgotPasswordViewModel {
    var onNextScreen: ((String) -> Void)? { get set }
    var emailError: ObservableUI<String?> { get set }

    func checkEmail(email: String)
}

class MockForgotPasswordViewModel: ForgotPasswordViewModel {

    var onNextScreen: ((String) -> Void)?
    var emailError: ObservableUI<String?> = ObservableUI(nil)

    private let forgotPasswordService: ForgotPasswordServiceProtocol

    init(service: ForgotPasswordServiceProtocol) {
        forgotPasswordService = service
    }

    func checkEmail(email: String) {
        if email.isEmpty {
            emailError.value = "Введите данные."
        } else {
            forgotPasswordService.checkEmail(email: email) { [weak self] result in
                switch result {
                case .success:
                    self?.onNextScreen?(email)

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
