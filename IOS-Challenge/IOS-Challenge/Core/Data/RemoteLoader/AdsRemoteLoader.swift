//
//  AdsRemoteLoader.swift
//  IOS-Challenge
//
//  Created by Sreekutty Maya on 01/06/2025.
//

import Foundation


final class AdsRemoteLoader : AdsLoader {
    
    let client : HTTPClient!
    
    init(client: HTTPClient!) {
        self.client = client
    }
    
    func getAds(url: String) async throws -> [AdsDTO] {
       let data = try await self.client.get(url: url)
       return try JSONDecoder().decode([AdsDTO].self, from: data)
    }
    
    func getSingleAd(url: String) async throws -> AdsDetailDTO {
       let data = try await self.client.get(url: url)
       return try JSONDecoder().decode(AdsDetailDTO.self, from: data)
    }
    
}


