//
//  ConversationListViewModel.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 26.03.2021.
//

import Foundation

class ConversationListViewModel: ConversationListViewModelProtocol {
    var items: Observable<[Conversation]> = Observable([])
    var error: Observable<String?> = Observable(nil)

    private let service: ConversationsFirebaseServiceProtocol
    private let coordinator: ChatCoordinator
    let myId = KeychainService.getChatId()

    init(service: ConversationsFirebaseServiceProtocol, coordinator: ChatCoordinator) {
        self.service = service
        self.coordinator = coordinator
    }

    func setup() {
        if let id = myId {
            service.setListeners(to: id) { [weak self] result in
                switch result {
                case .failure(let error):
                    self?.error.value = "Ошибка с подключением к сети + \n \(error.localizedDescription)"
                case .success(let array):
                    DispatchQueue.main.async {
                        self?.items.value = array
                    }
                }
            }
        } else {
            error.value = InetErrorNames.failedConnection
        }
    }

    func didSelectItem(at index: Int) {
        coordinator.goToChatView(id: items.value[index].id, username: items.value[index].username)
    }
}
