//
//  TabView.swift
//  FruitSearcher
//
//  Created by Carolane on 30/09/2022.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            FruitList()
                .tabItem {
                    Image(systemName: "basket")
                    Text("Fruit list")
                }
        
            
            ShoppingListView()
                .tabItem {
                    Image(systemName: "cart.badge.plus")
                    Text("Shopping list")
                }
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
