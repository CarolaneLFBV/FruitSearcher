//
//  FruitListTests.swift
//  FruitSearcherUITests
//
//  Created by Carolane on 07/10/2022.
//

import Foundation
import XCTest

class FruitListTests: XCTestCase {
    func testFruitInfos() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        app.tabBars["Tab Bar"].buttons["Fruit list"].tap()
        app.collectionViews/*@START_MENU_TOKEN@*/.buttons["Apple"]/*[[".cells.buttons[\"Apple\"]",".buttons[\"Apple\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["_TtGC7SwiftUI32NavigationStackHosting"].buttons["Fruit list"].tap()
    }
}
