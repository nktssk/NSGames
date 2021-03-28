//
//  ChatFireBaseService.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 26.03.2021.
//

import Foundation
import Firebase

class ChatFireBaseService: ChatFireBaseServiceProtocol {
    public static let shared = ChatFireBaseService()

    private init() { }

    private lazy var users = Firestore.firestore().collection(FirebaseNames.usersCollection)

    func sendMessage(to otherUserId: String, message: Message, completion: @escaping (Bool) -> Void) {
        if let id = UserDefaults.standard.string(forKey: UserDefaultsNames.myId) {
            let otherUserConversation = users.document(otherUserId).collection(FirebaseNames.conversationsCollection).document(id)
            let myConversation = users.document(id).collection(FirebaseNames.conversationsCollection).document(otherUserId)
            let otherUserMessages = users.document(otherUserId).collection(FirebaseNames.conversationsCollection).document(id).collection(FirebaseNames.messagesCollection)
            let myMessages = users.document(id).collection(FirebaseNames.conversationsCollection).document(otherUserId).collection(FirebaseNames.messagesCollection)
            let messageData: [String: Any] = ["content": message.content,
                                              "created": message.created,
                                              "senderId": id]
            let lastMessageData: [String: Any] = ["lastMessageText": message.content,
                                                  "lastActivity": Timestamp(date: message.created)]
            otherUserConversation.setData(lastMessageData, merge: true)
            otherUserMessages.addDocument(data: messageData)
            myMessages.addDocument(data: messageData)
            myConversation.setData(lastMessageData, merge: true)
            return completion(true)
        } else {
            return completion(false)
        }
    }

    func setListeners(to chatId: String, completion: @escaping (Result<[Message], Error>) -> Void) {
        if let id = UserDefaults.standard.string(forKey: UserDefaultsNames.myId) {
            let messages = users.document(id).collection(FirebaseNames.conversationsCollection).document(chatId).collection(FirebaseNames.messagesCollection)
            messages.addSnapshotListener({ result, error in
                if let error = error {
                    completion(.failure(error))
                }

                if let docs = result?.documents {
                    var messagess = [Message]()
                    for doc in docs {
                        let data = doc.data()
                        if let content = data[FirebaseNames.messageContent] as? String,
                           let senderId = data[FirebaseNames.messageSender] as? String,
                           let date = data[FirebaseNames.messageDate] as? Timestamp {
                            messagess.append(Message(content: content, created: date.dateValue(), senderId: senderId))
                        }
                    }
                    messagess.sort { $0.created.compare($1.created) == .orderedDescending }
                    completion(.success(messagess))
                }
            })
        } else {
            print("lol")
            // TODO: Change
        }
    }
}
