//
//  FruitAPI.swift
//  FruitSearcher
//
//  Created by Carolane on 30/09/2022.
//

import Foundation

class FruitAPI : ObservableObject{
    @Published var fruits = [Fruit]()
    
    func loadData(completion:@escaping ([Fruit]) -> ()) {
        guard let url = URL(string: "https://www.fruityvice.com/api/fruit/all") else {
            print("URL invalide.")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            let fruits = try! JSONDecoder().decode([Fruit].self, from: data!)
            //print(fruits)
            DispatchQueue.main.async {
                completion(fruits)
            }
        }.resume()
        
    }
}
