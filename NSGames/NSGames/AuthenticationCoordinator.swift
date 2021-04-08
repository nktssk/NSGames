//
//  AuthenticationCoordinator.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 24.03.2021.
//

import UIKit

class AuthenticationCoordinator: Coordinator {
    let navigationController = UINavigationController()
    var mainCoordinator: MainCoordinator?

    init() {
        let controller = SignInViewController()
        controller.viewModel = MockSignInViewModel(service: RestSignInService(), coordinator: self)
        navigationController.pushViewController(controller, animated: true)
    }

    func getStartViewController() -> UIViewController {
        return navigationController
    }

    func goToSignUpView() {
        let controller = SignUpViewController()
        controller.viewModel = MockSignUpViewModel(service: RestSignUpService(), coordinator: self)
        navigationController.pushViewController(controller, animated: true)
    }

    func goToForgotPasswordView() {
        let controller = ForgotPasswordViewController()
        controller.viewModel = MockForgotPasswordViewModel(service: RestForgotPassword(), coordinator: self)
        navigationController.pushViewController(controller, animated: true)
    }

    func goToCodeVerifyView(email: String) {
        let nextController = CodeVerifyViewController()
        nextController.viewModel = MockCodeVerifyViewModel(service: RestCodeVerifyService(), coordinator: self, email: email)
        navigationController.pushViewController(nextController, animated: true)
    }

    func popView() {
        navigationController.popViewController(animated: true)
    }

    func authFinished() {
        mainCoordinator?.goToTabBar()
    }
}
