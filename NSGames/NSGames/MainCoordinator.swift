//
//  MainCoordinator.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 24.03.2021.
//

import UIKit

class MainCoordinator {
    private let window = UIWindow()

    func start() {
        window.makeKeyAndVisible()
        window.backgroundColor = .white
        let coordinator = OnboardingCoordinator()
        coordinator.mainCoordinator = self
        setRootViewController(coordinator.getStartViewController(), duration: 1)
    }

    func goToTabBar() {
        let contoller = AppTabBarController(mainCoordinator: self)
        setRootViewController(contoller, duration: 0.25)
    }

    func onboardingAnimationFinish() {
        KeychainService.deleteAll()
        if KeychainService.getToken() != nil {
            goToTabBar()
        } else {
//            goToTabBar()
            let coordinator = AuthenticationCoordinator()
            coordinator.mainCoordinator = self
            setRootViewController(coordinator.getStartViewController(), duration: 0.25)
        }
    }

    func setRootViewController(_ vc: UIViewController, duration: TimeInterval) {
        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(with: window,
                          duration: duration,
                          options: .transitionCrossDissolve,
                          animations: nil,
                          completion: nil)
    }
}
