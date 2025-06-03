//
//  URLSessionClient.swift
//  IOS-Challenge
//
//  Created by Sreekutty Maya on 01/06/2025.
//

import Foundation

final class URLSessionClient : HTTPClient {
    private let session: URLSession

    init(session: URLSession = .shared) {
        self.session = session
    }

    func get(url: String) async throws -> Data {
        let url = URL(string: url)!
        let request = URLRequest(url: url)
        let (data, response) = try await session.data(for: request)
        guard let statusCode = (response as? HTTPURLResponse)?.statusCode, statusCode >= 200 &&  statusCode <= 299 else {
            throw URLError(.badServerResponse)
        }
        print(data,url)
        return data
    }
}


//final class URLSessionClient : HTTPClient {
//    let session : URLSession!
//    init(session: URLSession! = URLSession.shared) {
//        self.session = session
//    }
//    func get(url: String) async throws -> Data {
//        let url =  URL(string: url)!
//        let (data,response) = try await session.data(for: URLRequest(url:url))
//        guard let statusCode = (response as? HTTPURLResponse)?.statusCode,statusCode >= 200 else {
//            throw URLError(.badServerResponse)
//        }
//        return data
//    }
//    
//    
//}
