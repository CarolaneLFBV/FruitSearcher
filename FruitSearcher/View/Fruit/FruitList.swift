//
//  FruitList.swift
//  FruitSearcher
//
//  Created by Carolane on 30/09/2022.
//

import SwiftUI

struct FruitList: View {
    @State var fruits = [Fruit]()
    @State private var searchText = ""
    @Environment(\.colorScheme) var colorScheme
    @State private var showSettings = false
    
    var searchResults: [Fruit] {
        if searchText.isEmpty {
            return fruits
        } else {
            return fruits.filter { $0.name == searchText}
        }
    }
    
    var body: some View {
        NavigationStack {
                VStack {
                    List {
                        ForEach(searchResults) { fruit in
                            NavigationLink(destination: FruitInfos(fruit: fruit)) {
                                HStack {
                                    Image(fruit.name)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 50 , height: 50)
                                        .padding()
                                    
                                    Text(fruit.name)
                                        .font(.system(size: 20, weight: .medium))
                                    
                                    Spacer()
                                    
                                    if FavoriteFruit.favorites[fruit.id] != true {
                                        Image(systemName: "star")
                                            .foregroundColor(colorScheme == .dark ? .white : .purple)
                                    } else {
                                        Image(systemName: "star.fill")
                                            .foregroundColor(colorScheme == .dark ? .white : .purple)
                                    }
                                }
                            }
                        }
                        
                    }
                    .searchable(text: $searchText)
                    .navigationTitle("Fruit list 🍎")
                    .scrollContentBackground(.hidden)
                }
                .onAppear {
                    FruitAPI().loadData { (fruits) in
                        self.fruits = fruits
                    }
                    
                    for i in 0..<fruits.count {
                        FavoriteFruit.favorites[i] = UserDefaults.standard.bool(forKey: "\(fruits[i].name)isFavorite")
                    }
                }
                .toolbar(content: {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: SettingsView()) {
                            Label("Paramètres", systemImage: "gear")
                                .foregroundColor(.purple)
                    }
                }
            })
        }
    }
}

struct FruitList_Previews: PreviewProvider {
    static var previews: some View {
        FruitList()
    }
}
