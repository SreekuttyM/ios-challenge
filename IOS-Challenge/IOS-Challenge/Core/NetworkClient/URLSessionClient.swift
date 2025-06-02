//
//  URLSessionClient.swift
//  IOS-Challenge
//
//  Created by Sreekutty Maya on 01/06/2025.
//

import Foundation


final class URLSessionClient : HTTPClient {
   
    func get(url: String) async throws -> Data {
        let url =  URL(string: url)!
        let (data,response) = try await URLSession.shared.data(for: URLRequest(url:url))
        guard let statusCode = (response as? HTTPURLResponse)?.statusCode,statusCode >= 200 else {
            throw URLError(.badServerResponse)
        }
        return data
    }
    
    
}
