//
//  AppDelegate.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 03.03.2021.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var mainCoordinator: MainCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        mainCoordinator = MainCoordinator()
        mainCoordinator?.start()
        FirebaseApp.configure()
        return true
    }
}
