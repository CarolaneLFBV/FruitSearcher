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
                                }
                            }
                        }
                        
                    }
                    .searchable(text: $searchText)
                    .navigationTitle("Fruit list")
                    .navigationBarTitleDisplayMode(.inline)
                    .scrollContentBackground(.hidden)
                }
                .onAppear {
                    FruitAPI().loadData { (fruits) in
                        self.fruits = fruits
                    }
                }
        }
    }
}

struct FruitList_Previews: PreviewProvider {
    static var previews: some View {
        FruitList()
    }
}
