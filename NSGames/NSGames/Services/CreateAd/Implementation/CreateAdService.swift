//
//  CreateAdService.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 18.04.2021.
//

import Foundation
import Alamofire
import Kingfisher

class CreateAdService: CreateAdServiceProtocol {
    func uploadAd(images: [Data], ad: AdForm, completion: @escaping (Result<(), CreateAdError>) -> Void) {

        AF.request(CreateAdPath.createAd,
                   method: .post,
                   parameters: ad,
                   encoder: JSONParameterEncoder.default,
                   headers: HeaderService.shared.getHeaders()).responseJSON(queue: DispatchQueue.global(qos: .userInitiated)) { response in
                    if response.error != nil {
                        return completion(.failure(.noConnection))
                    }
                    if let statusCode = response.response?.statusCode, !(200...300).contains(statusCode) {
                        return completion(.failure(.badRequest))
                    }
                    guard let data = response.data, let id = try? JSONDecoder().decode(AdId.self, from: data).id else {
                        return completion(.failure(.badRequest))
                    }

                    for image in images {
                        AF.upload(multipartFormData: { (multipart: MultipartFormData) in multipart.append(image, withName: "photo", fileName: "photo.jpeg", mimeType: "image/jpeg") },
                                  to: CreateAdPath.uploadPhoto + "\(id)",
                                  headers: HeaderService.shared.getHeaders()).responseJSON { response in
                                        if let statusCode = response.response?.statusCode, !(200...300).contains(statusCode) {
                                        return completion(.failure(.badRequest))
                                        }
                        }
                    }
        }
    }
}