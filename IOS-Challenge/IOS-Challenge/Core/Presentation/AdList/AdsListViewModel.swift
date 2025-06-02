//
//  AdsListViewModel.swift
//  IOS-Challenge
//
//  Created by Sreekutty Maya on 01/06/2025.
//

import Foundation

enum AdListViewState {
    case isLoading
    case failed(error : Error)
    case loaded(ads: [Ads])
}

@MainActor
final class AdsListViewModel {
    @Published var state : AdListViewState = .isLoading
    @Published var errorMessage : String = ""
    @Published var showErrorView : Bool = false
    @Published var ads : [Ads] = []
    @Published var favorites : [FavoriteItem] = []

    let repository : AdsRepo!
     
    init(repository: AdsRepo!) {
        self.repository = repository
    }
    
    func getAds() {
        Task {
            do {
               let ads = try await self.repository.getAds(url: Constants.baseURL + Constants.adLists)
                favorites = try await FavoriteManager().loadFavorites()
                state = .loaded(ads: ads)
            } catch {
                state = .failed(error: error)
            }
        }
    }
    
    
    func favoriteIconPressed(item : Ads) async throws {
        let favItem = FavoriteItem (
            itemId: item.propertyCode,
            date: Date.now
        )
            let isFavorited = try await FavoriteManager().isFavorite(favItem)
            print("isFirst \n \(isFavorited)")
            if !isFavorited {
                try await FavoriteManager().add(favItem)
                print("favItem \n \(favItem)")
                self.favorites.append(favItem)
                print("isFavorited \n \(self.favorites)")

            } else {
                try await FavoriteManager().remove(favItem)
                self.favorites.removeAll { item in
                    item.itemId == favItem.itemId
                }
            }
    }
    
}
