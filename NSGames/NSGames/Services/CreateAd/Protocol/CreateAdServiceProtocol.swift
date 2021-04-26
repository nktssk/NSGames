//
//  CreateAdServiceProtocol.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 18.04.2021.
//

import Foundation

protocol CreateAdServiceProtocol {
    func uploadAd(images: [Data], ad: AdForm, completion: @escaping (Result<(), CreateAdError>) -> Void)
}
