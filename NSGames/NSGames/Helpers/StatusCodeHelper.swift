//
//  StatusCodeHelper.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 25.05.2021.
//

import UIKit

enum StatusCodeHelper {
    static func isForbidden(statusCode: Int) {
        if statusCode == 403, let coordinator = (UIApplication.shared.delegate as? AppDelegate)?.mainCoordinator {
            DispatchQueue.main.async {
                coordinator.goToLogin()
            }
        }
    }
}
