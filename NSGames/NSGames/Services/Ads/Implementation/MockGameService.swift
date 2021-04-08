//
//  MockGameService.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 24.03.2021.
//

import UIKit

class MockGameService: GameServiceProtocol {
    func getImages(id: Int, completion: @escaping (Result<[UIImage], Error>) -> Void) {
        let images = [#imageLiteral(resourceName: "1025088688"), #imageLiteral(resourceName: "15e1c713762f8b5e8e63038d098f0bae"), #imageLiteral(resourceName: "5_big"), #imageLiteral(resourceName: "mTlgY5FIoaRc25_Eu4RJ_Q")]
        return completion(.success(images))
    }

    func getStringData(id: Int, completion: (Result<GameSreenConfig, Error>) -> Void) {
        let data = GameSreenConfig(title: "Red dead Redemtion",
                                   description: "Добрый день! \n Мы зaнимаeмcя продажей цифpовыx веpcий игp для кoнcолeй Хbox One! \n Пoкупая у нас вы получаeтe: \n 1) Выгoдные цeны на игры и подписки Gаmе pass, Livе Gold, Gаmе рass Ultimatе для вaшей конcоли. \n 2) Cтабильную теxничeскую пoддepжку на периoд иcпользовaния товaрa. \n 3) Вoзможность дoбaвитьcя в нaшу  группу в вк и веceлo пообщаться, получить последние новости в сфере гейминга. \n \n RDR 2 ХВОХ ОNе цифровой ключ.",
                                   messageId: "5a01a6f4-ae25-457b-95cc-500f7300e04c",
                                   price: 2999,
                                   date: Date(), profile: Profile(id: 345, username: "Pasandep"))
        return completion(.success(data))
    }
}
