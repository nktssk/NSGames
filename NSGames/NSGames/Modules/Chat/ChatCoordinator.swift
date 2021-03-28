//
//  ChatCoordinator.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 25.03.2021.
//

import UIKit

class ChatCoordinator: Coordinator {
    private let navigationController = UINavigationController()

    func getFirstViewController() -> UIViewController {
        let controller = ConversationListViewController()
        controller.viewModel = ConversationListViewModel(service: ConversationFirebaseService.shared, coordinator: self)
        navigationController.pushViewController(controller, animated: true)
        return navigationController
    }

    func goToChatView(id: String, username: String) {
        let controller = ChatViewController()
        controller.viewModel = ChatViewModel(service: ChatFireBaseService.shared, id: id, title: username)
        navigationController.pushViewController(controller, animated: true)
    }
}
