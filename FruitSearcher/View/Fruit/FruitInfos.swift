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
            alpha: 0.3
        )
    }
}

struct FruitInfos: View {
    @State var fruit: Fruit
    @State var isFavorite: Bool = false
    @Environment(\.colorScheme) var colorScheme

    
    var body: some View {
        ZStack {
            Color(UIColor.random)
                .ignoresSafeArea()
            
            VStack {
                    Text(fruit.name)
                    .font(.system(size: 30, weight: .bold, design: .none))
                    .foregroundColor(.white)
                        
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
                            .foregroundColor(.purple)
                            .bold()
                    }
                
                    Spacer()
                        .frame(height: 30)
        
                    VStack {
                        if isFavorite == false {
                            Button() {
                                FavoriteFruit.favorites[fruit.id] = true
                                isFavorite = true
                            } label: {
                                Label("Ajouter aux favoris", systemImage: "star")
                                    .frame(height: 20)
                                    .foregroundColor(colorScheme == .dark ? .white : .purple)
                                    .padding()
                                    .background(colorScheme == .dark ? .purple : .white)
                                    .clipShape(RoundedRectangle(cornerRadius: 100))
                            }
                        } else {
                            Button() {
                                FavoriteFruit.favorites[fruit.id] = false
                                isFavorite = false
                            } label: {
                                Label("Retirer des favoris", systemImage: "star.fill")
                                    .frame(height: 20)
                                    .foregroundColor(colorScheme == .dark ? .white : .purple)
                                    .padding()
                                    .background(colorScheme == .dark ? .purple : .white)
                                    .clipShape(RoundedRectangle(cornerRadius: 100))
                            }
                        }
                        
                        Spacer()
                            .frame(height: 30)
                        
                        List {
                            Section("Description :") {
                                HStack {
                                    Text("Carbohydrates: ")
                                    Spacer()
                                    Text("\(fruit.nutritions.carbohydrates, specifier: "%.2f")")
                                        .foregroundColor(.purple)
                                }
                                
                                HStack {
                                    Text("Protein: ")
                                    Spacer()
                                    Text("\(fruit.nutritions.protein, specifier: "%.2f")")
                                        .foregroundColor(.purple)
                                }
                                
                                HStack {
                                    Text("Fat: ")
                                    Spacer()
                                    Text("\(fruit.nutritions.fat, specifier: "%.2f")")
                                        .foregroundColor(.purple)
                                }
                                
                                HStack {
                                    Text("Calories: ")
                                    Spacer()
                                    Text("\(fruit.nutritions.calories, specifier: "%.2f")")
                                        .foregroundColor(.purple)
                                }
                                
                                HStack {
                                    Text("Sugar: ")
                                    Spacer()
                                    Text("\(fruit.nutritions.sugar, specifier: "%.2f")")
                                        .foregroundColor(.purple)
                                }

                            }
                        }
                        .font(.system(size: 15, weight: .bold))
                        .scrollContentBackground(.hidden)
                        .onAppear {
                            if FavoriteFruit.favorites[fruit.id] != true {
                                isFavorite = false
                            } else {
                                isFavorite = true
                            }
                        }
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

