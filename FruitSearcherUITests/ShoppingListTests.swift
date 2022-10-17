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
        
        app.buttons["Shopping List"].tap()
        app.textFields["Add an ingredient"].tap()
        
        app/*@START_MENU_TOKEN@*/.keys["T"]/*[[".keyboards.keys[\"T\"]",".keys[\"T\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.keys["e"]/*[[".keyboards.keys[\"e\"]",".keys[\"e\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.keys["s"]/*[[".keyboards.keys[\"s\"]",".keys[\"s\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.keys["t"]/*[[".keyboards.keys[\"t\"]",".keys[\"t\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        app.buttons["Add"].tap()
    }
    
}
