//
//  AdsMapper.swift
//  IOS-Challenge
//
//  Created by Sreekutty Maya on 01/06/2025.
//

import Foundation

extension AdsDTO {
     func toDomain() -> Ads {
        return Ads(propertyCode: self.propertyCode, propertyType: self.propertyType, thumbnail: self.thumbnail, priceInfo: String(self.priceInfo.price.amount) +  self.priceInfo.price.currencySuffix, address: self.address, province: self.province, municipality: self.municipality, district: self.district, medias: self.multimedia.images.map {$0.url})
    }
    
}

extension AdsDetailDTO {
    func toDomain() -> AdsDetail {
        return AdsDetail(propertyCode: String(self.adid), propertyType: self.propertyType, priceInfo: String(self.priceInfo.amount), medias: self.multimedia.images.map {$0.url}, description: self.propertyComment, bedRoomCount: String(self.moreCharacteristics.roomNumber), bathRoomCount: String(self.moreCharacteristics.bathNumber), liftExists: self.moreCharacteristics.lift, roomSize: String(self.moreCharacteristics.constructedArea), floor: self.moreCharacteristics.floor)
    }
       
}

