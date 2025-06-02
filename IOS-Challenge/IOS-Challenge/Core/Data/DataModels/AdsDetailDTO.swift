//
//  AdsDetailDTO.swift
//  IOS-Challenge
//
//  Created by Sreekutty Maya on 02/06/2025.
//

import Foundation


struct AdsDetailDTO: Codable {
    let adid, price: Int
    let priceInfo: PriceInfo
    let operation, propertyType, extendedPropertyType, homeType: String
    let state: String
    let multimedia: Multimedia
    let propertyComment: String
    let ubication: Ubication
    let country: String
    let moreCharacteristics: MoreCharacteristics
    let energyCertification: EnergyCertification
}

// MARK: - EnergyCertification
struct EnergyCertification: Codable {
    let title: String
    let energyConsumption, emissions: Emissions
}

// MARK: - Emissions
struct Emissions: Codable {
    let type: String
}

// MARK: - MoreCharacteristics
struct MoreCharacteristics: Codable {
    let communityCosts, roomNumber, bathNumber: Int
    let exterior: Bool
    let housingFurnitures: String
    let agencyIsABank: Bool
    let energyCertificationType, flatLocation: String
    let modificationDate, constructedArea: Int
    let lift, boxroom, isDuplex: Bool
    let floor, status: String
}

// MARK: - Multimedia
struct Multimedia: Codable {
    let images: [Image]
}

// MARK: - Image
struct Image: Codable {
    let url: String
    let tag: String
}

// MARK: - PriceInfo
struct PriceInfo: Codable {
    let amount: Int
    let currencySuffix: String
}

// MARK: - Ubication
struct Ubication: Codable {
    let latitude, longitude: Double
}
