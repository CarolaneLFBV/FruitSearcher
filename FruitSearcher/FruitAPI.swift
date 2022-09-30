//
//  FruitAPI.swift
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


class FruitAPI : ObservableObject{
    @Published var fruits = [Fruit]()
    
    func loadData(completion:@escaping ([Fruit]) -> ()) {
        guard let url = URL(string: "https://www.fruityvice.com/api/fruit/all") else {
            print("URL invalide.")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            let fruits = try! JSONDecoder().decode([Fruit].self, from: data!)
            print(fruits)
            DispatchQueue.main.async {
                completion(fruits)
            }
        }.resume()
        
    }
}
