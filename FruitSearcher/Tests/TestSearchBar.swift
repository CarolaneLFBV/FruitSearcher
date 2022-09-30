//
//  TestSearchBar.swift
//  FruitSearcher
//
//  Created by Carolane on 30/09/2022.
//

import SwiftUI


struct TestSearchBar: View {
    let names = ["Holly", "Josh", "Rhonda", "Ted"]
    @State private var searchText = ""

    var body: some View {
        NavigationView {
            List {
                ForEach(searchResults, id: \.self) { name in
                    NavigationLink(destination: Text(name)) {
                        Text(name)
                    }
                }
            }
            .searchable(text: $searchText)
            .navigationTitle("Contacts")
        }
    }

    var searchResults: [String] {
        if searchText.isEmpty {
            return names
        } else {
            return names.filter { $0.contains(searchText) }
        }
    }
}

struct TestSearchBar_Previews: PreviewProvider {
    static var previews: some View {
        TestSearchBar()
    }
}
