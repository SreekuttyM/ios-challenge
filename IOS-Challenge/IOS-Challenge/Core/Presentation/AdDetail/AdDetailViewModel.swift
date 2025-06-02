//
//  AdDetailViewModel.swift
//  IOS-Challenge
//
//  Created by Sreekutty Maya on 02/06/2025.
//

import Foundation
enum AdDetailViewState {
    case isLoading
    case failed(error : Error)
    case loaded(ads: AdsDetail)
}

@MainActor
final class AdDetailViewModel {
    
    @Published var state : AdDetailViewState = .isLoading
    let repository : AdsRepo!
    var selectedAdId : String? = nil

    init(repository: AdsRepo!, selectedAdId: String? = nil) {
        self.repository = repository
        self.selectedAdId = selectedAdId
    }
    
    func getAds() {
        Task {
            do {
                guard let selectedAdId = selectedAdId else {
                    state =  .failed(error: URLError(.badURL))
                    return
                }
                let ads = try await self.repository.singleAd(url: Constants.baseURL + "detail_\(selectedAdId).json")
                state = .loaded(ads: ads)
            } catch {
                state = .failed(error: error)
            }
        }
    }
    
}
