//
//  MockGameService.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 24.03.2021.
//

import Foundation

class MockGameService: GameService {
    func getData(id: Int, completion: (Result<[HomeScreenCellConfig], Error>) -> Void) {
    }
}
