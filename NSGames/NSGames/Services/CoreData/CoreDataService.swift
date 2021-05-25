//
//  CoreDataService.swift
//  NSGames
//
//  Created by Nikita Sosyuk on 24.05.2021.
//

import Foundation
import CoreData

protocol CoreDataServiceProtocol {
    var mainContext: NSManagedObjectContext { get }

    func add(_ offer: Offer)
    func deleteOffer(_ offer: Offer)
}

final class CoreDataService: CoreDataServiceProtocol {

    static let offerDataModelName = "NSGames"

    var didUpdateDataBase: ((CoreDataService) -> Void)?

    private let dataModelName: String

    private lazy var storeContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: dataModelName)
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                print("Unresolved error \(error), \(error.userInfo)")
            }
        }
        container.viewContext.automaticallyMergesChangesFromParent = true
        return container
    }()

    lazy var mainContext: NSManagedObjectContext = {
        return self.storeContainer.viewContext
    }()

    init(dataModelName: String) {
        self.dataModelName = dataModelName
    }

    func performSave(_ block: @escaping (NSManagedObjectContext) -> Void) {
        storeContainer.performBackgroundTask { context in
            context.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
            block(context)
            if context.hasChanges {
                do {
                    try self.performSave(in: context)
                } catch {
                    assertionFailure(error.localizedDescription)
                }
            }
        }
    }

    private func performSave(in context: NSManagedObjectContext) throws {
        try context.save()
        if let parent = context.parent {
            try performSave(in: parent)
        }
    }

    func add(_ offer: Offer) {
        performSave { context in
            let fetchRequest: NSFetchRequest<OfferDB> = OfferDB.fetchRequest()
                let predicate = NSPredicate(format: "id == %i", offer.id)
            fetchRequest.predicate = predicate
            do {
                let offerDB = try context.fetch(fetchRequest)
                if offerDB.isEmpty {
                    _ = OfferDB(offer: offer, context: context)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }

    func deleteOffer(_ offer: Offer) {
        performSave { context in
            let fetchRequest: NSFetchRequest<OfferDB> = OfferDB.fetchRequest()
            let predicate = NSPredicate(format: "id == %i", offer.id)
            fetchRequest.predicate = predicate
            do {
                let channelsDB = try context.fetch(fetchRequest)
                guard let channelToDelete = channelsDB.first else { return }
                context.delete(channelToDelete)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
