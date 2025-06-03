//
//  FavoriteRepository.swift
//  IOS-Challenge
//
//  Created by Sreekutty Maya on 03/06/2025.
//


final class FavoriteRepository : FavRepo {
    
    let localloader : AdsManager!

    init(localloader: AdsManager) {
        self.localloader = localloader
    }
    
    func getFavorites() async throws -> [FavoriteModel] {
        let items = try await localloader.fetchFavorites()
        return items
    }
    
    func addToFavorite(favorite: FavoriteModel) async throws {
        try await localloader.addToFavorite(favoriteModel: favorite)
    }
    
    func isFavorite(item: FavoriteModel) async throws -> Bool {
        try await localloader.isFavorite(item)
    }
    
    func removeFavorite(item: FavoriteModel) async throws  {
        try await localloader.deleteFavorite(adId: item.itemId)
    }
}
