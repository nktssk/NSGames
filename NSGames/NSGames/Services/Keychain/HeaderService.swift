//
//  HeaderService.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 25.04.2021.
//

import Foundation
import Alamofire

class HeaderService {
    static let shared = HeaderService()

    private init() { }

    func getHeaders() -> HTTPHeaders {
        guard let token = KeychainService.getToken() else { return HTTPHeaders() }

        let headersData: [String: String] = ["Authorization": token]
        return HTTPHeaders(headersData)
    }
}
