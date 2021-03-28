//
//  ChatViewModelProtocol.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 26.03.2021.
//

import Foundation

protocol ChatViewModelProtocol {
    var title: Observable<String> { get set }
    var items: Observable<[Message]> { get set }

    func sendMessage(text content: String)
    func setup()
}

class ChatViewModel: ChatViewModelProtocol {
    var title: Observable<String> = Observable("")
    var items: Observable<[Message]> = Observable([])

    let myId = UserDefaults.standard.string(forKey: UserDefaultsNames.myId) ?? "nil"
    private let service: ChatFireBaseServiceProtocol
    private let otherUserId: String
    private let titleSrting: String

    init(service: ChatFireBaseServiceProtocol, id: String, title: String) {
        self.service = service
        otherUserId = id
        titleSrting = title
    }

    func setup() {
        title.value = titleSrting
        service.setListeners(to: otherUserId) { [weak self] result in
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
    }

    func sendMessage(text content: String) {
        let message = Message(content: content, created: Date(), senderId: myId)
        service.sendMessage(to: otherUserId, message: message) { flag in
            if flag == false {
                print("error")
                // TODO: Alert inet
            }
        }
    }
}
