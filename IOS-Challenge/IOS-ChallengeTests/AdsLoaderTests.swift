//
//  AdsLoaderTests.swift
//  IOS-ChallengeTests
//
//  Created by Sreekutty Maya on 03/06/2025.
//

import XCTest
@testable import IOS_Challenge
final class AdsLoaderTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testGetAdsReturnsDecodedArray() async throws {
        let ad = [
            AdsDTO(propertyCode: "test-code", price: 999999),
            AdsDTO(propertyCode: "test-code", price: 999999)
        ]
        let data = AdsTestHelper.anyData(json: ad)!
        let response = AdsTestHelper.anyHTTPResponse()
        
        MockURLProtocol.mockResponse = (data, response)
        
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let session = URLSession(configuration: config)
        let client = URLSessionClient(session: session)
        let sut = AdsRemoteLoader(client: client)
        
        // Call SUT
        let result = try await sut.getAds(url: AdsTestHelper.anyURLString())
        
        // Assert
        XCTAssertEqual(result, [
            AdsDTO(propertyCode: "test-code", price: 999999),
            AdsDTO(propertyCode: "test-code", price: 999999)
        ])
    }
    
    func testGetAdsThrowsOnInvalidJSON() async throws {
        
        let invalidJSON = AdsTestHelper.invalidJSON.data(using: .utf8)!
        do {
            _ = try JSONDecoder().decode([AdsDTO].self, from: invalidJSON)
            XCTFail("Expected decoding to fail")
        } catch {
            XCTAssertTrue(error is DecodingError)
        }
        
    }
    
    func testGetSingleAdThrowsOnClientError() async {
        MockURLProtocol.mockError = URLError(.notConnectedToInternet)
        
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let session = URLSession(configuration: config)
        let client = URLSessionClient(session: session)
        let sut = AdsRemoteLoader(client: client)
        
        do {
            _ = try await sut.getSingleAd(url: AdsTestHelper.anyURLString())
            XCTFail("Expected client to throw error")
        } catch {
            XCTAssertEqual((error as? URLError)?.code, .notConnectedToInternet)
        }
    }
    
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    
    
}
