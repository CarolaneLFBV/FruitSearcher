//
//  FruitList.swift
//  FruitSearcher
//
//  Created by Carolane on 30/09/2022.
//

import SwiftUI

struct FruitList: View {
    @State var fruits = [Fruit]()
    
    var body: some View {
        VStack {
            List(fruits) { fruit in
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
        }.onAppear {
            FruitAPI().loadData { (fruits) in
                self.fruits = fruits
            }
        }
    }
}

struct FruitList_Previews: PreviewProvider {
    static var previews: some View {
        FruitList()
    }
}
