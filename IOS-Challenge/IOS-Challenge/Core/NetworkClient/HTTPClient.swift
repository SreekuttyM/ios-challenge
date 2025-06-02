//
//  HTTPClient.swift
//  IOS-Challenge
//
//  Created by Sreekutty Maya on 01/06/2025.
//

import Foundation


protocol HTTPClient {
    func get(url : String) async throws -> Data
}
