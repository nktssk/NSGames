//
//  SignUpViewModel.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 09.03.2021.
//

import Foundation

protocol SignUpViewModel {
    var onSuccesReg: (() -> Void)? { get set }
    var signUpError: ObservableUI<String?> { get set }

    func signUp(login: String, email: String, password: String, passwordAgain: String)
}

class MockSignUpViewModel: SignUpViewModel {

    private let signUpService: SignUpServiceProtocol

    init(service: SignUpServiceProtocol) {
        signUpService = service
    }

    // MARK: - Business logic properties
    var onSuccesReg: (() -> Void)?

    var signUpError: ObservableUI<String?> = ObservableUI(nil)

    // MARK: - SignInViewModel
    func signUp(login: String, email: String, password: String, passwordAgain: String) {
        if email.isEmpty && login.isEmpty && password.isEmpty && passwordAgain.isEmpty {
            return signUpError.value = "Пожалуйста, заполните данными поля."
        }
        if email.isEmpty {
            return signUpError.value = "Введите адрес электронной почты."
        }
        if password.isEmpty {
            return signUpError.value = "Введите пароль."
        }
        if passwordAgain.isEmpty {
            return signUpError.value = "Повторите пароль."
        }
        if password != passwordAgain {
            return signUpError.value = "Пароли не совпадают."
        }
        signUpService.signUp(username: login, email: email, password: password) { [weak self] result in
            switch result {
            case .success:
                self?.onSuccesReg?()

            case .failure(let error):
                switch error {
                case .noConnection:
                    self?.signUpError.value = "Нет соединения."
                case .emailIsOccupied:
                    self?.signUpError.value = "Email уже занят."
                }
            }
        }
    }
}
