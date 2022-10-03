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
        ZStack {
            Color("ColorPurple").opacity(0.1)
                .ignoresSafeArea()
            
            VStack {
                Text(fruit.name)
                    .font(.system(size: 30))
                    
                Spacer()
                    .frame(height: 1)
                
                Image(fruit.name)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .cornerRadius(30)
                    .padding()
                
                HStack {
                    Text("Fruit's family:")
                    
                    Text(fruit.family)
                        .foregroundColor(Color("ColorPurple"))
                }
            
                    List {
                        Text("Carbohydrates : \(fruit.nutritions.carbohydrates, specifier: "%.2f")")
                        Text("Protein : \(fruit.nutritions.protein, specifier: "%.2f")")
                        Text("Fat : \(fruit.nutritions.fat, specifier: "%.2f")")
                        Text("Calories : \(fruit.nutritions.calories, specifier: "%.2f")")
                        Text("Sugar : \(fruit.nutritions.sugar, specifier: "%.2f")")
                    }
                    .font(.system(size: 15, weight: .bold))
                    .scrollContentBackground(.hidden)
                
            }
        }
    }
}


struct FruitInfos_Previews: PreviewProvider {
    static var previews: some View {
        FruitInfos(fruit: Fruit(id: 6, name: "Apple", family: "Rosaceae", order: "Rosales", nutritions: Nutritions(carbohydrates: 11.4, protein: 0.3, fat: 0.4, calories: 52, sugar: 10.3)))
    }
}

