//
//  AdModel.swift
//  IOS-Challenge
//
//  Created by Sreekutty Maya on 01/06/2025.
//

import Foundation

struct Ads : Hashable {
    let propertyCode: String
    let thumbnail: String
    let priceInfo: String
    let address, province, municipality, district: String
    let medias: [String]
}
