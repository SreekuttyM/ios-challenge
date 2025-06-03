//
//  IOS_ChallengeUITests.swift
//  IOS-ChallengeUITests
//
//  Created by Sreekutty Maya on 01/06/2025.
//

import XCTest

final class IOS_ChallengeUITests: XCTestCase {
    let app = XCUIApplication()
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
       
        app.launch()
            
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    @MainActor
    func testExample() throws {
        // UI tests must launch the application that they test.
       
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
    }
    
    
    func test_initialViewWithNAvTitleExists() {
        // ← Put cursor inside here
        let exploreTitle = NSLocalizedString("EXPLORE", comment: "")

        let navBar = app.navigationBars[exploreTitle]
        let titleElement = navBar.staticTexts[exploreTitle]

        XCTAssertTrue(titleElement.exists)
    }
    
    func testloadDataWithContentCheckFirstItem() {
        // ← Put cursor inside here
        let cell = app.tables.cells
            .containing(.staticText, identifier: "calle de Lagasca Madrid Barrio de Salamanca Madrid")
            .element

        XCTAssertTrue(cell.exists)
        XCTAssertTrue(cell.staticTexts["flat"].exists)
    }
    
    
    func testFavoriteButtonPressedAndFavorited() {
        let cell = app.tables.cells
            .containing(.staticText, identifier: "calle de Lagasca Madrid Barrio de Salamanca Madrid")
            .element
        let button = cell.buttons["favorite"]
        let initialValue = button.label

        button.tap()
        
        let expectedValue = initialValue == "Favorited" ? "Not Favorited" : "Favorited"


        XCTAssertEqual(button.label,expectedValue)
    }
    
    @MainActor
    func test_loadDetailScreenWhenClickedEachCard() {
        // ← Put cursor inside here
        let exploreTitle = NSLocalizedString("EXPLORE", comment: "")

        let navBar = app.navigationBars[exploreTitle]
        let titleElement = navBar.staticTexts[exploreTitle]

        XCTAssertTrue(titleElement.exists)
    }


    @MainActor
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
