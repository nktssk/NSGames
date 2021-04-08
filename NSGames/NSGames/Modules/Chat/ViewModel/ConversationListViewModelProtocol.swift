//
//  ConversationListViewModel.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 25.03.2021.
//

import Foundation

protocol ConversationListViewModelProtocol {
    var items: Observable<[Conversation]> { get set }
    var error: Observable<String?> { get set }

    func setup()
    func didSelectItem(at: Int)
}
