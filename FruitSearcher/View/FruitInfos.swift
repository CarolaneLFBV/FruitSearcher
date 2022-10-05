//
//  FruitInfos.swift
//  FruitSearcher
//
//  Created by Carolane on 30/09/2022.
//

import SwiftUI

extension UIColor {
    static var random: UIColor {
        return UIColor(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            alpha: 1.0
        )
    }
}

struct FruitInfos: View {
    @State var fruit: Fruit
    
    var body: some View {
        ZStack {
            Color(UIColor.random)
                .ignoresSafeArea()
            
            VStack {
                    Text(fruit.name)
                        .font(.system(size: 30))
                        .foregroundColor(Color("ColorPurple"))
                        
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
                            .bold()
                    }
                
                    Spacer()
                        .frame(height: 80)
        
                    VStack {
                        List {
                            Section("Description :") {
                                HStack {
                                    Text("Carbohydrates: ")
                                    Spacer()
                                    Text("\(fruit.nutritions.carbohydrates, specifier: "%.2f")")
                                        .foregroundColor(Color("ColorPurple"))
                                }
                                
                                HStack {
                                    Text("Protein: ")
                                    Spacer()
                                    Text("\(fruit.nutritions.protein, specifier: "%.2f")")
                                        .foregroundColor(Color("ColorPurple"))
                                }
                                
                                HStack {
                                    Text("Fat: ")
                                    Spacer()
                                    Text("\(fruit.nutritions.fat, specifier: "%.2f")")
                                        .foregroundColor(Color("ColorPurple"))
                                }
                                
                                HStack {
                                    Text("Calories: ")
                                    Spacer()
                                    Text("\(fruit.nutritions.calories, specifier: "%.2f")")
                                        .foregroundColor(Color("ColorPurple"))
                                }
                                
                                HStack {
                                    Text("Sugar: ")
                                    Spacer()
                                    Text("\(fruit.nutritions.sugar, specifier: "%.2f")")
                                        .foregroundColor(Color("ColorPurple"))
                                }

                            }
                        }
                        .font(.system(size: 15, weight: .bold))
                        .scrollContentBackground(.hidden)
                }
            }
        }
    }
}


struct FruitInfos_Previews: PreviewProvider {
    static var previews: some View {
        FruitInfos(fruit: Fruit(id: 6, name: "Apple", family: "Rosaceae", order: "Rosales", nutritions: Nutritions(carbohydrates: 11.4, protein: 0.3, fat: 0.4, calories: 52, sugar: 10.3)))
    }
}

