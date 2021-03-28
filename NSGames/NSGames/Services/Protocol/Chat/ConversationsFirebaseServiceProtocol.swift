//
//  FirebaseServiceProtocol.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 25.03.2021.
//

import Foundation

protocol ConversationsFirebaseServiceProtocol {
    func setListeners(to myId: String, completion: @escaping (Result<[Conversation], Error>) -> Void)
    func createNewConversation(to otherUserId: String)
}
