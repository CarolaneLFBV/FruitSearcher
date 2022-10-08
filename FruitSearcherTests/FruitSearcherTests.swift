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

    override func setUp() {
        super.setUp()
       do {
            let testBundle = Bundle(for: type(of: self))
            if let url = testBundle.url(forResource: "fruit", withExtension: "json") {
                let jsonData = try Data(contentsOf: url)
                self.fruit = try JSONDecoder().decode(Fruit.self, from: jsonData)
            }
        } catch {
            print("Erreur")
        }
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
    
    func testNutritionsCarbohydrates() {
        XCTAssertEqual(fruit?.nutritions.carbohydrates, 11.4)
    }
    
    func testNutritionsProtein() {
        XCTAssertEqual(fruit?.nutritions.protein, 0.3)
    }
    
    func testNutritionsFat() {
        XCTAssertEqual(fruit?.nutritions.fat, 0.4)
    }
    
    func testNutritionsCalories() {
        XCTAssertEqual(fruit?.nutritions.calories, 52.0)
    }
    
    func testNutritionsSugar() {
        XCTAssertEqual(fruit?.nutritions.sugar, 10.3)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
