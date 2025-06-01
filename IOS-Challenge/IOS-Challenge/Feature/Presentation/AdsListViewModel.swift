//
//  AdsListViewModel.swift
//  IOS-Challenge
//
//  Created by Sreekutty Maya on 01/06/2025.
//

import Foundation
import Combine

enum AdListViewState {
    case isLoading
    case failed(error : Error)
    case loaded(ads: [Ads])
}

@MainActor
final class AdsListViewModel {
    @Published var state : AdListViewState = .isLoading
    @Published var ads : [Ads] = []
    var cancellables = Set<AnyCancellable>()

    let repository : AdsRepo!
     
    init(repository: AdsRepo!) {
        self.repository = repository
        self.initializeView()
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
    
    func initializeView() {
        $state
            .receive(on: RunLoop.main)
            .sink { [weak self] state in
                guard let self = self else { return }
                switch(state) {
                    case .isLoading:
                        self.getAds()
                    case .failed(error: let error):
                        print("Some error ocurred.\(error)")
                    case .loaded(ads: let ads):
                        print(ads)
                }
            }
            .store(in: &cancellables)

    }
}
