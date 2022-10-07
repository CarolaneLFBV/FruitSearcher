import SwiftUI

struct TabBar: View {
    @State private var selectedIndex = 0
    @Environment(\.colorScheme) var colorScheme
    
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
                    FruitMLView(classifier: ImageClassifier())

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
                                .foregroundColor(selectedIndex == number ? .purple : Color(UIColor.lightGray))
                            
                            Text(names[number])
                                .font(.system(size: 10,
                                              weight: .regular,
                                              design: .default))
                                .foregroundColor(selectedIndex == number ? .purple : Color(UIColor.lightGray))
                        }
                        Spacer()
                    })
                }
            }
            .animation(.easeOut(duration: 0.8), value: selectedIndex)
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
