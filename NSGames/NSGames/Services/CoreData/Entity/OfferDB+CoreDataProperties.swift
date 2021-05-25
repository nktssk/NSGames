//
//  OfferDB+CoreDataProperties.swift
//
//
//  Created by Nikita Sosyuk on 24.05.2021.
//
//

import Foundation
import CoreData

extension OfferDB {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<OfferDB> {
        return NSFetchRequest<OfferDB>(entityName: "OfferDB")
    }

    @NSManaged public var chatId: String?
    @NSManaged public var games: [Int]?
    @NSManaged public var id: Int64
    @NSManaged public var price: Double
    @NSManaged public var text: String?
    @NSManaged public var username: String?
}
