//
//  FruitInfos.swift
//  FruitSearcher
//
//  Created by Carolane on 30/09/2022.
//

import SwiftUI

struct FruitInfos: View {
    @State var fruit: Fruit
    
    var body: some View {
        VStack {
            Text(fruit.name)
                .font(.system(size: 30))
                
            Spacer()
                .frame(height: 1)
            
            Image(fruit.name)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .padding()
            
            VStack {
                Text("\(fruit.family)")
            }
            
            VStack() {
                List {
                    Text("Carbohydrates : \(fruit.nutritions.carbohydrates, specifier: "%.2f")")
                        .font(.system(size: 15, weight: .bold))
                    Text("Protein : \(fruit.nutritions.protein, specifier: "%.2f")")
                        .font(.system(size: 15, weight: .bold))
                    Text("Fat : \(fruit.nutritions.fat, specifier: "%.2f")")
                        .font(.system(size: 15, weight: .bold))
                    Text("Calories : \(fruit.nutritions.calories, specifier: "%.2f")")
                        .font(.system(size: 15, weight: .bold))
                    Text("Sugar : \(fruit.nutritions.sugar, specifier: "%.2f")")
                        .font(.system(size: 15, weight: .bold))
                }
            }
            Spacer()
        }
    }
}


struct FruitInfos_Previews: PreviewProvider {
    static var previews: some View {
        FruitInfos(fruit: Fruit(id: 6, name: "Apple", family: "Rosaceae", order: "Rosales", nutritions: Nutritions(carbohydrates: 11.4, protein: 0.3, fat: 0.4, calories: 52, sugar: 10.3)))
    }
}

