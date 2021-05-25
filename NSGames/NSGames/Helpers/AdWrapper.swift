//
//  AdWrapper.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 25.05.2021.
//

import Foundation

struct AdWrapper: Comparable {
    let ad: AdTableViewCellConfig
    let index: Int

    static func < (lhs: AdWrapper, rhs: AdWrapper) -> Bool {
        lhs.index < rhs.index
    }

    static func == (lhs: AdWrapper, rhs: AdWrapper) -> Bool {
        lhs.index == rhs.index
    }
}
