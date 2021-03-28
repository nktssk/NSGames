//
//  ConversationListViewModel.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 26.03.2021.
//

import Foundation

class ConversationListViewModel: ConversationListViewModelProtocol {
    var items: Observable<[Conversation]> = Observable([])

    private let service: ConversationsFirebaseServiceProtocol
    private let coordinator: ChatCoordinator
    let myId = UserDefaults.standard.string(forKey: UserDefaultsNames.myId)

    init(service: ConversationsFirebaseServiceProtocol, coordinator: ChatCoordinator) {
        self.service = service
        self.coordinator = coordinator
    }

    func setup() {
        if let id = myId {
            service.setListeners(to: id) { [weak self] result in
                switch result {
                case .failure(let error):
                    print(error)
                // TODO: alert
                case .success(let array):
                    DispatchQueue.main.async {
                        self?.items.value = array
                    }
                }
            }
        } else {
            // TODO: alert
        }
    }

    func didSelectItem(at index: Int) {
        coordinator.goToChatView(id: items.value[index].id, username: items.value[index].username)
    }
}
