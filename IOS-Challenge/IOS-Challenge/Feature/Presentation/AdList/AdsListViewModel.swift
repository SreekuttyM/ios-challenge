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

    let repository : AdsRepo!
     
    init(repository: AdsRepo!) {
        self.repository = repository
    }
    
    func getAds() {
        Task {
            do {
               let ads = try await self.repository.getAds(url: Constants.baseURL + Constants.adLists)
                state = .loaded(ads: ads)
            } catch {
                state = .failed(error: error)
            }
        }
    }
}
