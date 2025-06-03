//
//  URLSessionClientTests.swift
//  IOS-ChallengeTests
//
//  Created by Sreekutty Maya on 03/06/2025.
//

import XCTest
@testable import IOS_Challenge


final class URLSessionClientTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        URLProtocol.registerClass(MockURLProtocol.self)

    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        URLProtocol.unregisterClass(MockURLProtocol.self)

    }
    

    func testSuccessfulResponseReturnsData() async throws {
        let expectedData = "Hello, world!".data(using: .utf8)!
        let url = URL(string: AdsTestHelper.anyURLString())!
        let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)!
        
        MockURLProtocol.mockResponse = (expectedData, response)
        
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLProtocol.self]
        let session = URLSession(configuration: configuration)
        let sut = URLSessionClient(session: session)
        
        let result = try await sut.get(url: AdsTestHelper.anyURLString())
        
        XCTAssertEqual(result, expectedData)
    }
    
    func testBadStatusCodeThrowsError() async {
        let response = HTTPURLResponse(url: URL(string: AdsTestHelper.anyURLString())!, statusCode: 404, httpVersion: nil, headerFields: nil)!

        MockURLProtocol.mockResponse = (Data(), response)

        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLProtocol.self]
        let session = URLSession(configuration: configuration)
        let sut = URLSessionClient(session: session)
        do {
            let _ = try await sut.get(url: AdsTestHelper.anyURLString())
            XCTFail("Expected to throw URLError.badServerResponse")
        } catch {
            XCTAssertTrue((error as? URLError)?.code == .badServerResponse)
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
