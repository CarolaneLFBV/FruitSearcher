//
//  FruitSearcherUITests.swift
//  FruitSearcherUITests
//
//  Created by Carolane on 30/09/2022.
//

import XCTest

final class FruitSearcherUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testFruitInfos() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        app.tabBars["Tab Bar"].buttons["Fruit list"].tap()
        app.collectionViews/*@START_MENU_TOKEN@*/.buttons["Apple"]/*[[".cells.buttons[\"Apple\"]",".buttons[\"Apple\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["_TtGC7SwiftUI32NavigationStackHosting"].buttons["Fruit list"].tap()
    }
    
    func testShopping() throws {
        let app = XCUIApplication()
        app.launch()
        
        app.tabBars["Tab Bar"].buttons["Shopping list"].tap()
        app.buttons["Add"].tap()
        app.collectionViews.cells.children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.children(matching: .staticText).element.swipeLeft()
    }
    
    func testCoreML() throws {
        let app = XCUIApplication()
        app.launch()
        
        app.tabBars["Tab Bar"].buttons["Fruit Recognition"].tap()
        app.images["Photo"].tap()
        app/*@START_MENU_TOKEN@*/.scrollViews.otherElements.images["Photo, 30 septembre, 7:44 PM"]/*[[".otherElements[\"Photos\"].scrollViews.otherElements",".otherElements[\"Photo, 01 octobre, 6:21 PM, Photo, 30 septembre, 7:44 PM, Photo, Raw Red Organic Strawberries in a Bunch, 30 septembre, 7:26 PM, Photo, 30 mars 2018, 9:14 PM, Photo, 08 août 2012, 11:55 PM, Photo, 08 août 2012, 11:29 PM, Photo, 08 août 2012, 8:52 PM, Photo, 09 octobre 2009, 11:09 PM, Photo, 13 mars 2011, 1:17 AM\"].images[\"Photo, 30 septembre, 7:44 PM\"]",".images[\"Photo, 30 septembre, 7:44 PM\"]",".scrollViews.otherElements"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/.tap()

    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
