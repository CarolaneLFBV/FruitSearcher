//
//  FruitModel.swift
//  FruitSearcher
//
//  Created by Carolane on 30/09/2022.
//

import Foundation

struct Fruit: Codable, Identifiable {
    var id: Int
    var name: String
    var family: String
    var order: String
    var nutritions: Nutritions
}

struct Nutritions: Codable {
    var carbohydrates: Double
    var protein: Double
    var fat: Double
    var calories: Double
    var sugar: Double
}
