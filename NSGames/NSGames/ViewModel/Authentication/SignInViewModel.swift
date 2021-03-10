//
//  SignInViewController.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 08.03.2021.
//

import Foundation

protocol SignInViewModel {
    var onSuccesAuth: (() -> Void)? { get set }
    var onRegScreen: (() -> Void)? { get set }
    var signInError: Observable<String?> { get set }

    func signIn(email: String, password: String)
    func registration()
}

class MockSignInViewModel: SignInViewModel {

    var signInService: SignInService

    init(service: SignInService) {
        signInService = service
    }

    // MARK: - Business logic properties
    var onSuccesAuth: (() -> Void)?
    var onRegScreen: (() -> Void)?

    var signInError: Observable<String?> = Observable(nil)

    // MARK: - SignInViewModel
    func signIn(email: String, password: String) {
        if email.isEmpty && password.isEmpty {
            return signInError.value = "Пожалуйста, заполните данными поля."
        }
        if email.isEmpty {
            return signInError.value = "Введите адрес электронной почты."
        }
        if password.isEmpty {
            return signInError.value = "Введите пароль."
        }
        signInService.signIn(email: email, password: password) { [weak self] result in
            switch result {
            case .success:
                self?.onSuccesAuth?()

            case .failure(let error):
                switch error {
                case .noConnection:
                    self?.signInError.value = "Нет соединения"
                case .wrongData:
                    self?.signInError.value = "Неверные данные"
                }
            }
        }
    }

    func registration() {
        onRegScreen?()
    }
}
