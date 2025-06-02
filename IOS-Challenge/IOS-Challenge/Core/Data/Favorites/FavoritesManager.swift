//
//  FavoritesManager.swift
//  IOS-Challenge
//
//  Created by Sreekutty Maya on 02/06/2025.
//

import Foundation

struct FavoriteItem : Codable,Hashable {
    let itemId : String
    let date : Date
}

class FavoriteManager {
    private let storageKey: String = "Favorites"

    
    // MARK: - Public Methods

    func isFavorite(_ item: FavoriteItem) async throws -> Bool {
        let favorites = try await loadFavorites()
        return favorites.contains { favItem in
            favItem.itemId == item.itemId
        }
    }

    func add(_ item: FavoriteItem) async throws {
        var favorites = try await loadFavorites()
        favorites.append(item)
        try await saveFavorites(favorites: favorites)
    }

    func remove(_ item: FavoriteItem) async throws {
        var favorites = try await loadFavorites()
        favorites.removeAll { favItem in
            favItem.itemId == item.itemId
        }
        try await saveFavorites(favorites: favorites)
    }

   

    // MARK: - Persistence

    func loadFavorites() async throws -> [FavoriteItem] {
        guard let data = UserDefaults.standard.data(forKey: storageKey),
            let favorites = try? JSONDecoder().decode([FavoriteItem].self, from: data) else {
            return []
        }
        return favorites
    }

    private func saveFavorites(favorites: [FavoriteItem]) async throws {
        let data = try? JSONEncoder().encode(favorites)
        UserDefaults.standard.set(data, forKey: storageKey)
    }
}

