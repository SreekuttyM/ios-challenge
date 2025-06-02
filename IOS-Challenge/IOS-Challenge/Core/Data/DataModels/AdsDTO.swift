//
//  AdsDTO.swift
//  IOS-Challenge
//
//  Created by Sreekutty Maya on 01/06/2025.
//

import Foundation


struct AdsDTO : Codable {
    let propertyCode: String
    let thumbnail: String
    let floor: String
    let price: Int
    let priceInfo: PriceInfo
    let propertyType, operation: String
    let size: Int
    let exterior: Bool
    let rooms, bathrooms: Int
    let address, province, municipality, district: String
    let country, neighborhood: String
    let latitude, longitude: Double
    let description: String
    let multimedia: Multimedia
    let features: Features
    let parkingSpace: ParkingSpace?
    
    struct Features: Codable {
        let hasAirConditioning, hasBoxRoom: Bool
        let hasSwimmingPool, hasTerrace, hasGarden: Bool?
    }
    
    
    struct ParkingSpace: Codable {
        let hasParkingSpace, isParkingSpaceIncludedInPrice: Bool
    }

    // MARK: - Price
    struct PriceInfo: Codable {
        let price: Price
    }
    
    struct Price: Codable {
        let amount: Int
        let currencySuffix: String
    }

    struct Multimedia: Codable {
        let images: [MediaImage]
    }
    
    struct MediaImage: Codable {
        let url: String
        let tag: String
    }

}
