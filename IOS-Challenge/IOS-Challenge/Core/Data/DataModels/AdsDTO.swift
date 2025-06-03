//
//  AdsDTO.swift
//  IOS-Challenge
//
//  Created by Sreekutty Maya on 01/06/2025.
//

import Foundation


struct AdsDTO : Codable,Equatable {
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
    
    struct Features: Codable,Equatable {
        let hasAirConditioning, hasBoxRoom: Bool
        let hasSwimmingPool, hasTerrace, hasGarden: Bool?
    }
    
    
    struct ParkingSpace: Codable,Equatable {
        let hasParkingSpace, isParkingSpaceIncludedInPrice: Bool
    }

    // MARK: - Price
    struct PriceInfo: Codable,Equatable {
        let price: Price
    }
    
    struct Price: Codable,Equatable {
        let amount: Int
        let currencySuffix: String
    }

    struct Multimedia: Codable,Equatable {
        let images: [MediaImage]
    }
    
    struct MediaImage: Codable,Equatable {
        let url: String
        let tag: String
    }
    
}


#if DEBUG
extension AdsDTO {
    init(
        propertyCode: String = "1",
        thumbnail: String = "",
        floor: String = "1",
        price: Double = 0,
        priceInfo: PriceInfo = .init(price: .init(amount: 0, currencySuffix: "€")),
        propertyType: String = "flat",
        operation: String = "sale",
        size: Double = 100,
        exterior: Bool = false,
        rooms: Int = 1,
        bathrooms: Int = 1,
        address: String = "test address",
        province: String = "test province",
        municipality: String = "test municipality",
        district: String = "test district",
        country: String = "es",
        neighborhood: String = "test",
        latitude: Double = 0,
        longitude: Double = 0,
        description: String = "desc",
        multimedia: Multimedia = .init(images: []),
        parkingSpace : ParkingSpace = .init(hasParkingSpace: true, isParkingSpaceIncludedInPrice: true),
        features: Features = .init(hasAirConditioning: true, hasBoxRoom: true, hasSwimmingPool: true, hasTerrace: true, hasGarden: true
        )
    ) {
        self.propertyCode = propertyCode
        self.thumbnail = thumbnail
        self.floor = floor
        self.price = Int(price)
        self.priceInfo = priceInfo
        self.propertyType = propertyType
        self.operation = operation
        self.size = Int(size)
        self.exterior = exterior
        self.rooms = rooms
        self.bathrooms = bathrooms
        self.address = address
        self.province = province
        self.municipality = municipality
        self.district = district
        self.country = country
        self.neighborhood = neighborhood
        self.latitude = latitude
        self.longitude = longitude
        self.description = description
        self.multimedia = multimedia
        self.features = features
        self.parkingSpace = parkingSpace
    }
}
#endif
