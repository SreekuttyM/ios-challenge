//
//  AdsListViewModelTests.swift
//  IOS-ChallengeTests
//
//  Created by Sreekutty Maya on 04/06/2025.
//

import XCTest
@testable import IOS_Challenge
final class AdsListViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    @MainActor
    func test_favoriteIconPressed_addsItemToFavoritesIfNotFavorited() async throws {
        // Arrange

        let sut =  AdsListViewModel(favRepo: FavoriteRepository(localloader: AdsManager(coreDataManager: CoreDataTestManager())))
        let ads = Ads(propertyCode: "1", propertyType: "ssds", thumbnail: "", priceInfo: "", address: "", province: "", municipality: "", district: "", medias: [])// Simplified struct

        // Act
        try await sut.favoriteIconPressed(item: ads)

        // Assert
        XCTAssertEqual(sut.favorites.count, 1)
        XCTAssertEqual(sut.favorites.first?.itemId, "1")
    }
    
    @MainActor
    func test_favoriteIconPressed_removesItemIfAlreadyFavorited() async throws {
        // Arrange
        let sut =  AdsListViewModel(favRepo: FavoriteRepository(localloader: AdsManager(coreDataManager: CoreDataTestManager())))

        sut.favorites = [FavoriteModel(itemId: "1", date: .now)]
        let item = Ads(propertyCode: "1", propertyType: "ssds", thumbnail: "", priceInfo: "", address: "", province: "", municipality: "", district: "", medias: [])

        // Act
        try await sut.favoriteIconPressed(item: item)

        // Assert
        XCTAssertTrue(sut.favorites.isEmpty)
    }
    
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
