//
//  AdsRepository.swift
//  IOS-Challenge
//
//  Created by Sreekutty Maya on 01/06/2025.
//

import Foundation


final class AdsRepository : AdsRepo {
    
    let loader : AdsRemoteLoader!
    
    init(loader: AdsRemoteLoader!) {
        self.loader = loader
    }
    
    func getAds(url: String) async throws -> [Ads] {
        let ads = try await self.loader.getAds(url: url)
        return ads.map { adsDto in
            adsDto.toDomain()
        }
    }
    
    func singleAd(url: String) async throws -> AdsDetail {
        let ads = try await self.loader.getSingleAd(url: url)
        return ads.toDomain()
        
    }
    
}
