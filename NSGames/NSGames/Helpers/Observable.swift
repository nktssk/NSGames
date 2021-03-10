//
//  File.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 08.03.2021.
//

import Foundation

class Observable<T> {
    typealias Listener = (T) -> Void

    private var listener: Listener?

    var value: T {
        didSet {
            listener?(value)
        }
    }

    init(_ value: T) {
        self.value = value
    }

    func bind(listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
}
