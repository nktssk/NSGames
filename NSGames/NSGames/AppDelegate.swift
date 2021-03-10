//
//  AppDelegate.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 03.03.2021.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .white
        let controller = SignInViewController()
        let viewModel = MockSignInViewModel(service: MockSignInService())
        controller.viewModel = viewModel
        window?.rootViewController = UINavigationController(rootViewController: controller)
        return true
    }
}
