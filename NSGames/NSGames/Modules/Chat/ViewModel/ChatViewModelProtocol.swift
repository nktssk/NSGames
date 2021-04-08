//
//  ChatViewModelProtocol.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 26.03.2021.
//

import Foundation

protocol ChatViewModelProtocol {
    var title: Observable<String> { get set }
    var error: Observable<String?> { get set }
    var items: Observable<[Message]> { get set }

    func sendMessage(text content: String)
    func setup()
}

class ChatViewModel: ChatViewModelProtocol {
    var title: Observable<String> = Observable("")
    var error: Observable<String?> = Observable(nil)
    var items: Observable<[Message]> = Observable([])

    let myId = KeychainService.getChatId()
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
        if let myId = myId {
            service.setListeners(myId: myId, to: otherUserId) { [weak self] result in
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
            error.value = InetErrorNames.localData
        }
    }

    func sendMessage(text content: String) {
        if let id = myId {
            let message = Message(content: content, created: Date(), senderId: id)
            service.sendMessage(myId: id, to: otherUserId, message: message) { [weak self] flag in
                if flag == false {
                    self?.error.value = InetErrorNames.failedConnection
                }
            }
        }
    }
}
