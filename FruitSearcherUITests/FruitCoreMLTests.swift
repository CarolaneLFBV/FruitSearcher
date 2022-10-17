//
//  FruitCoreMLTests.swift
//  FruitSearcherUITests
//
//  Created by Carolane on 07/10/2022.
//

import Foundation
import XCTest

class FruitCoreMLTests: XCTestCase {
    
    func testCoreML() throws {
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["Fruit Recognition"].tap()
        app.windows.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.images["Camera"].tap()
        app/*@START_MENU_TOKEN@*/.buttons["PhotoCapture"]/*[[".buttons[\"Take Picture\"]",".buttons[\"PhotoCapture\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["Use Photo"]/*[[".buttons[\"Use Photo\"].staticTexts[\"Use Photo\"]",".buttons[\"Done\"].staticTexts[\"Use Photo\"]",".staticTexts[\"Use Photo\"]"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
    }
    
}
