//
//  DI.swift
//  IOS-Challenge
//
//  Created by Sreekutty Maya on 01/06/2025.
//

import Foundation
import UIKit


final class AppCompositionRoot {
    @MainActor static func composeAdsListModule() -> AdsListViewController {
        let client = URLSessionClient()
        let loader = AdsRemoteLoader(client: client)
        let repository = AdsRepository(loader: loader)
        let favRepo = FavoriteRepository(localloader: AdsManager(coreDataManager: CoreDataManager()))
        let viewModel = AdsListViewModel(repository: repository, favRepo: favRepo)
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AdsListViewController") as! AdsListViewController
        vc.viewModel = viewModel
        return vc
    }
    
    @MainActor static func composeAdsDetailModule(selectedAdId :String?) -> AdDetailViewController {
        let client = URLSessionClient()
        let loader = AdsRemoteLoader(client: client)
        let repository = AdsRepository(loader: loader)
        let viewModel = AdDetailViewModel(repository: repository, selectedAdId: selectedAdId)
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AdDetailViewController") as! AdDetailViewController
        vc.viewModel = viewModel
        return vc
    }
}
