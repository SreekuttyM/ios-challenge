//
//  CoreDataTestManager.swift
//  IOS-Challenge
//
//  Created by Sreekutty Maya on 03/06/2025.
//

import Foundation
import CoreData

class CoreDataTestManager: CoreDataManager {
    override init() {
        super.init()

        let persistentStoreDescription = NSPersistentStoreDescription()
        persistentStoreDescription.type = NSInMemoryStoreType

        let container = NSPersistentContainer(name: CoreDataTestManager.modelName, managedObjectModel: CoreDataTestManager.model) // Replace with your .xcdatamodeld file name
        container.persistentStoreDescriptions.forEach { storeDesc in
            storeDesc.shouldMigrateStoreAutomatically = true
            storeDesc.shouldInferMappingModelAutomatically = true
        }
        container.persistentStoreDescriptions = [persistentStoreDescription]

        container.loadPersistentStores { _, error in
            container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        persistentContainer = container
    }
    
   
}
