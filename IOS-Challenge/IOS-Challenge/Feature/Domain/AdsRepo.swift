//
//  AdsRepo.swift
//  IOS-Challenge
//
//  Created by Sreekutty Maya on 01/06/2025.
//

import Foundation

protocol AdsRepo {
    func getAds(url : String) async throws -> [Ads]
}
