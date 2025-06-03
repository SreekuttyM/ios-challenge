//
//  MockURLProtocol.swift
//  IOS-Challenge
//
//  Created by Sreekutty Maya on 03/06/2025.
//

import Foundation


class MockURLProtocol: URLProtocol {
    static var mockResponse: (Data, HTTPURLResponse)?
    static var mockError: Error?

    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }

    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }

    override func startLoading() {
        if let error = MockURLProtocol.mockError {
            self.client?.urlProtocol(self, didFailWithError: error)
        }
        else if let (data, response) = MockURLProtocol.mockResponse {
            self.client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
            self.client?.urlProtocol(self, didLoad: data)
        }
        self.client?.urlProtocolDidFinishLoading(self)
    }

    override func stopLoading() {}
}
