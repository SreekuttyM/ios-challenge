//
//  FavoriteItem+CoreDataProperties.swift
//  IOS-Challenge
//
//  Created by Sreekutty Maya on 03/06/2025.
//
//

import Foundation
import CoreData


extension FavoriteItem {

    @nonobjc public class func createFetchRequest() -> NSFetchRequest<FavoriteItem> {
        return NSFetchRequest<FavoriteItem>(entityName: "FavoriteItem")
    }

    @NSManaged public var adId: String
    @NSManaged public var favoritedDate: Date

}

extension FavoriteItem : Identifiable {

}
