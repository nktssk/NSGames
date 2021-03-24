//
//  AuthenticationCoordinator.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 24.03.2021.
//

import UIKit

class AuthenticationCoordinator {
    let navigationController = UINavigationController()
    var mainCoordinator: MainCoordinator?

    func start() -> UIViewController {
        let controller = SignInViewController()
        controller.viewModel = MockSignInViewModel(service: MockSignInService(), coordinator: self)
        controller.viewModel?.coordinator = self
        navigationController.pushViewController(controller, animated: true)
        return navigationController
    }

    func registration() {
        let controller = SignUpViewController()
        controller.viewModel = MockSignUpViewModel(service: MockSignUpService())
        controller.viewModel?.onSuccesReg = { [weak controller] in
            controller?.navigationController?.popViewController(animated: true)
        }
        navigationController.pushViewController(controller, animated: true)
    }

    func forgotPassword() {
        let controller = ForgotPasswordViewController()
        controller.viewModel = MockForgotPasswordViewModel(service: MockForgotPassword())
        controller.viewModel?.onNextScreen = { [weak controller] in
            let nextController = CodeVerifyViewController()
            nextController.viewModel = MockCodeVerifyViewModel(service: MockCodeVerifyService(), coordinator: self)
            controller?.navigationController?.pushViewController(nextController, animated: true)
        }
        navigationController.pushViewController(controller, animated: true)
    }

    func authFinished() {
        mainCoordinator?.authFinished()
    }
}
