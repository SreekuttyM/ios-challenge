//
//  AdsTestHelper.swift
//  IOS-ChallengeTests
//
//  Created by Sreekutty Maya on 03/06/2025.
//

import Foundation


struct AdsTestHelper {
    static let invalidJSON = """
               [
                          {
                             "propertyCode": "1",
                             "thumbnail": "https://img4.idealista.com/blur/480_360_mq/0/id.pro.es.image.master/aa/c2/63/1217034679.webp",
                             "floor": "2"
                             "price": 1195000.0,
                             "priceInfo": {
                               "price": {
                                 "amount": 1195000.0,
                                 "currencySuffix": "€"
                               }
                             },
                             "propertyType": "flat",
                             "operation": "sale",
                             "size": 133.0,
                             "exterior": false,
                             "rooms": 3,
                             "bathrooms": 2,
                             "address": "calle de Lagasca",
                             "province": "Madrid",
                             "municipality": "Madrid",
                             "district": "Barrio de Salamanca",
                             "country": "es",
                             "neighborhood": "Castellana",
                             "latitude": 40.4362687,
                             "longitude": -3.6833686,
                             "description": "Venta.Piso EN EXCLUSIVA. Castellana. Se ofrece en venta vivienda de 133 m² en el exclusivo Barrio de Salamanca, zona Castellana, con 3 dormitorios (uno en suite), 2 baños, amplio salón comedor, cocina independiente con office y lavadero. Cuenta con un amplio patio privado y armarios empotrados en todas las habitaciones. Reformado para optimizar el espacio, ofrece gran potencial para personalizarlo. Ubicado en una",
                             "multimedia": {
                               "images": [
                                 {
                                   "url": "https://img4.idealista.com/blur/480_360_mq/0/id.pro.es.image.master/aa/c2/63/1217034679.webp",
                                   "tag": "facade"
                                 },
                                 {
                                   "url": "https://img4.idealista.com/blur/480_360_mq/0/id.pro.es.image.master/aa/c2/63/1217034679.webp",
                                   "tag": "facade"
                                 }
                               ]
                             },
                          "parkingSpace": {
                            "hasParkingSpace": true,
                            "isParkingSpaceIncludedInPrice": true
                          },
                             "features": {
                               "hasSwimmingPool": false,
                                     "hasTerrace": false,
                                     "hasAirConditioning": true,
                                     "hasBoxRoom": false,
                                     "hasGarden": false
                             }
                           }  
               ]
"""
    static func anyData<T:Codable>(json:T) -> Data? {
        return try? JSONEncoder().encode(json)
    }
    
    static func anyHTTPResponse() -> HTTPURLResponse {
        return HTTPURLResponse(url: URL(string: anyURLString())!, statusCode: 200, httpVersion: nil, headerFields: nil)!
    }
    
    static func anyURLString() -> String {
        return "https://example.com"
    }
    
}
