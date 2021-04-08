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

    func registration() {
        let controller = SignUpViewController()
        controller.viewModel = MockSignUpViewModel(service: RestSignUpService())
        controller.viewModel?.onSuccesReg = { [weak controller] in
            controller?.navigationController?.popViewController(animated: true)
        }
        navigationController.pushViewController(controller, animated: true)
    }

    func forgotPassword() {
        let controller = ForgotPasswordViewController()
        controller.viewModel = MockForgotPasswordViewModel(service: RestForgotPassword())
        controller.viewModel?.onNextScreen = { [weak controller] email in
            let nextController = CodeVerifyViewController()
            nextController.viewModel = MockCodeVerifyViewModel(service: MockCodeVerifyService(), coordinator: self, email: email)
            controller?.navigationController?.pushViewController(nextController, animated: true)
        }
        navigationController.pushViewController(controller, animated: true)
    }

    func authFinished() {
        mainCoordinator?.goToTabBar()
    }
}
