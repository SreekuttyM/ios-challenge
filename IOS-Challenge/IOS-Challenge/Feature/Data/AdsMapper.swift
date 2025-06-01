//
//  AdsMapper.swift
//  IOS-Challenge
//
//  Created by Sreekutty Maya on 01/06/2025.
//

import Foundation

struct AdsMapper {
    static func toDomain(_ dto: AdsDTO) -> Ads {
        return Ads(propertyCode: dto.propertyCode, thumbnail: dto.thumbnail, priceInfo: String(dto.priceInfo.price.amount) + " " + dto.priceInfo.price.currencySuffix, address: dto.address, province: dto.province, municipality: dto.municipality, district: dto.district, medias: dto.multimedia.images.map {$0.url})
    }
    
   
}
