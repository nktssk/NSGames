//
//  SignInViewController.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 08.03.2021.
//

import Foundation

protocol SignInViewModel {
    var signInError: ObservableUI<String?> { get set }
    var coordinator: AuthenticationCoordinator { get set }

    func signIn(email: String, password: String)
    func registration()
    func forgotPassword()
}

class MockSignInViewModel: SignInViewModel {

    var signInService: SignInService
    var coordinator: AuthenticationCoordinator

    init(service: SignInService, coordinator: AuthenticationCoordinator) {
        signInService = service
        self.coordinator = coordinator
    }

    var signInError: ObservableUI<String?> = ObservableUI(nil)

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
                self?.coordinator.authFinished()

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
        coordinator.registration()
    }

    func forgotPassword() {
        coordinator.forgotPassword()
    }
}
