//
//  AdsDetail.swift
//  IOS-Challenge
//
//  Created by Sreekutty Maya on 02/06/2025.
//

import Foundation


struct AdsDetail : Hashable {
    let propertyCode: String
    let propertyType: String
    let priceInfo: String
    let medias: [String]
    let description: String
    let bedRoomCount: String
    let bathRoomCount: String
    let liftExists: Bool
    let roomSize: String
    let floor: String
}
