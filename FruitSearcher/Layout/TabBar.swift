import SwiftUI

struct TabBar: View {
    @State private var selectedIndex = 0
    
    let icons = [
    "basket",
    "cart.badge.plus",
    "camera",
    ]
    
    let names = [
    "Fruit List",
    "Shopping List",
    "Fruit Recognition"
    ]
    
    var body: some View {
        VStack {
            ZStack {
                switch selectedIndex {
                case 0:
                    FruitList()

                case 1:
                    ShoppingListView()
                    
                case 2:
                    FruitML(classifier: ImageClassifier())

                default:
                    FruitList()
                    
                }
                
            }
            
            HStack {
                ForEach(0..<3, id: \.self) { number in
                    Button(action: {
                        self.selectedIndex = number
                    }, label: {
                        Spacer()
                        VStack {
                            Image(systemName: icons[number])
                                .font(.system(size: 25,
                                              weight: .regular,
                                              design: .default))
                                .foregroundColor(selectedIndex == number ? Color("ColorPurple") : Color(UIColor.lightGray))
                            
                            Text(names[number])
                                .font(.system(size: 10,
                                              weight: .regular,
                                              design: .default))
                            .foregroundColor(selectedIndex == number ? Color("ColorPurple") : Color(UIColor.lightGray))
                        }
                        Spacer()
                    })
                }
            }
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
