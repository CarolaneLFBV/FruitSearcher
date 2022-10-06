//
//  FruitSearcherTests.swift
//  FruitSearcherTests
//
//  Created by Carolane on 30/09/2022.
//

import XCTest
@testable import FruitSearcher

final class FruitSearcherTests: XCTestCase {

    var fruit: Fruit?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testId() {
        XCTAssertEqual(fruit?.id, 6)
    }
    
    func testName() {
        XCTAssertEqual(fruit?.name, "Apple")
    }
    
    func testFamily() {
        XCTAssertEqual(fruit?.family, "Rosaceae")
    }
    
    func testOrder() {
        XCTAssertEqual(fruit?.order, "Rosales")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
