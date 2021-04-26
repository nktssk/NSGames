//
//  ChatCoordinator.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 25.03.2021.
//

import UIKit

protocol ChatCoordinatorProtocol: Coordinator {
    func goToChatView(id: String, username: String)
}

class ChatCoordinator: Coordinator {
    private let navigationController = UINavigationController()

    init() {
        let controller = ConversationListViewController()
        controller.viewModel = ConversationListViewModel(service: ConversationFirebaseService.shared, coordinator: self)
        navigationController.pushViewController(controller, animated: true)
    }

    func getStartViewController() -> UIViewController {
        return navigationController
    }

    func goToChatView(id: String, username: String) {
        let controller = ChatViewController()
        ChatFireBaseService.shared.otherUserName = username
        controller.viewModel = ChatViewModel(service: ChatFireBaseService.shared, id: id, title: username)
        navigationController.pushViewController(controller, animated: true)
    }
}
