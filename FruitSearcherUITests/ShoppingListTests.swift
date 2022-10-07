//
//  ShoppingListTests.swift
//  FruitSearcherUITests
//
//  Created by Carolane on 07/10/2022.
//

import Foundation
import XCTest

class ShoopingListTests: XCTestCase {
    
    func testShopping() throws {
        let app = XCUIApplication()
        app.launch()
        
        app.tabBars["Tab Bar"].buttons["Shopping list"].tap()
        app.buttons["Add"].tap()
        app.collectionViews.cells.children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.children(matching: .staticText).element.swipeLeft()
    }
    
}
