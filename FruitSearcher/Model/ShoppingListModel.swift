//
//  ShoppingListModel.swift
//  FruitSearcher
//
//  Created by Carolane on 30/09/2022.
//

import Foundation
import SwiftUI
import Combine

struct ShoppingList : Identifiable, Codable {
    var id = String()
    var shoppingItem = String()
}

class ShoppingListStorage: ObservableObject {
    @Published var shoppinglists = [ShoppingList]()
}
