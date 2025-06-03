//
//  AdsManager.swift
//  IOS-Challenge
//
//  Created by Sreekutty Maya on 03/06/2025.
//

import Foundation



class AdsManager {
    let coreDataManager: CoreDataManager

    init(coreDataManager: CoreDataManager) {
          self.coreDataManager = coreDataManager
    }

    func fetchFavorites() async throws -> [FavoriteModel] {
        let request = FavoriteItem.createFetchRequest()
        let context = coreDataManager.context
        request.returnsObjectsAsFaults = false
        do {
            let ads =  try context.fetch(request)
            var favAds: [FavoriteModel] = []
            for ad in ads {
                favAds.append(FavoriteModel(itemId: ad.adId, date: ad.favoritedDate))
            }
            return favAds

        } catch {
            throw error

        }
    }

    func addToFavorite(favoriteModel:FavoriteModel) async throws {
        let adItem = FavoriteItem(context: coreDataManager.context)
        adItem.adId = favoriteModel.itemId
        adItem.favoritedDate = favoriteModel.date
        
        if coreDataManager.context.hasChanges {
            do {
                try self.coreDataManager.context.save()
                print("Saved")
            } catch {
                let nserror = error as NSError
                throw nserror
            }
        }
    }

    
    func isFavorite(_ item: FavoriteModel) async throws -> Bool {
            let favorites = try await fetchFavorites()
            return favorites.contains { favItem in
                favItem.itemId == item.itemId
            }
        }
    
    func deleteFavorite(adId: String) async throws {
        let request = FavoriteItem.createFetchRequest()
        request.predicate = NSPredicate(format: "adId == %@", adId as String)
        if let fetchedTask = try? coreDataManager.context.fetch(request).first {
            coreDataManager.context.delete(fetchedTask)
        }
        if coreDataManager.context.hasChanges {
            do {
                try await coreDataManager.context.perform {
                    try self.coreDataManager.context.save()
                    print("deleted")
                }
            } catch {
                let nserror = error as NSError
                throw nserror
            }
        }
    }
    
   
}
