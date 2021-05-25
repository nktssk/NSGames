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

    @NSManaged public var chatId: String
    @NSManaged public var tradeCount: Int64
    @NSManaged public var id: Int64
    @NSManaged public var price: Double
    @NSManaged public var text: String?
    @NSManaged public var username: String

    convenience init(offer: Offer, context: NSManagedObjectContext) {
        self.init(context: context)
        self.id = Int64(offer.id)
        self.text = offer.description
        self.chatId = offer.chatId
        self.price = offer.price ?? -1000
        self.username = offer.username
        if let count = offer.tradeListCount {
            self.tradeCount = Int64(count)
        }
    }
}
