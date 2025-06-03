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
    @Published var favorites : [FavoriteModel] = []

    let repository : AdsRepo!
    let favRepository : FavoriteRepository!

    init(repository: AdsRepo? = nil,favRepo : FavoriteRepository) {
        self.repository = repository
        self.favRepository = favRepo
    }
    
    func getAds() {
        Task {
            do {
               let ads = try await self.repository.getAds(url: Constants.baseURL + Constants.adLists)
                favorites = try await self.favRepository.getFavorites()
                state = .loaded(ads: ads)
            } catch {
                state = .failed(error: error)
            }
        }
    }
    
    
    func favoriteIconPressed(item : Ads) async throws {
        let favItem = FavoriteModel (
            itemId: item.propertyCode,
            date: Date.now
        )
        let isFavorited = try await self.favRepository.isFavorite(item: favItem)
            print("isFirst \n \(isFavorited)")
            if !isFavorited {
                try await self.favRepository.addToFavorite(favorite: favItem)
                print("favItem \n \(favItem)")
                self.favorites.append(favItem)
                print("isFavorited \n \(self.favorites)")

            } else {
                try await self.favRepository.removeFavorite(item: favItem)
                self.favorites.removeAll { item in
                    item.itemId == favItem.itemId
                }
            }
    }
    
}
