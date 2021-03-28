//
//  ChatFireBaseServiceProtocol.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 26.03.2021.
//

import Foundation

protocol ChatFireBaseServiceProtocol {
    func sendMessage(to otherUserId: String, message: Message, completion: @escaping (Bool) -> Void)
    func setListeners(to chatId: String, completion: @escaping (Result<[Message], Error>) -> Void)
}
