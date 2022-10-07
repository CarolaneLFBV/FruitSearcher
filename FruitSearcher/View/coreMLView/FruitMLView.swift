//
//  FruitMLView.swift
//  FruitSearcher
//
//  Created by Carolane on 30/09/2022.
//

import SwiftUI

struct FruitMLView: View {
    @State var isPresenting: Bool = false
    @State var uiImage: UIImage?
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @ObservedObject var classifier: ImageClassifier
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationStack {
                VStack{
                    // MARK: - Buttons
                    HStack{
                        Image(systemName: "photo")
                            .frame(width: 80, height: 50)
                            .foregroundColor(colorScheme == .dark ? .white : .purple)
                            .background(colorScheme == .dark ? .purple : .white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .shadow(color: .black, radius: 3, x: 0, y:0 )
                            .onTapGesture {
                                isPresenting = true
                                sourceType = .photoLibrary
                            }
                        
                        Image(systemName: "camera")
                            .frame(width: 80, height: 50)
                            .foregroundColor(colorScheme == .dark ? .white : .purple)
                            .background(colorScheme == .dark ? .purple : .white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .shadow(color: .black, radius: 3, x: 0, y:0 )
                            .onTapGesture {
                                isPresenting = true
                                sourceType = .camera
                            }
                    }
                    .font(.title)
                    .foregroundColor(.blue)
                    
                    Spacer()
                        .frame(height: 20)
                    
                    // MARK: - Caption
                    Text("Please take or add any picture.")
                        .foregroundColor(colorScheme == .dark ? .white : .purple)
                        .font(.caption)
                    
                    Rectangle()
                        .strokeBorder()
                        .foregroundColor(colorScheme == .dark ? .white : .purple)
                        .overlay(
                            Group {
                                if uiImage != nil {
                                    Image(uiImage: uiImage!)
                                        .resizable()
                                        .scaledToFit()
                                }
                            }
                        )
                    
                    Spacer()
                        .frame(height: 30)
                    
                    // MARK: - AI Button
                    VStack{
                        Button(action: {
                            if uiImage != nil {
                                classifier.detect(uiImage: uiImage!)
                            }
                        }) {
                            Image(systemName: "magnifyingglass")
                                .font(.title)
                                .foregroundColor(.purple)
                        }
                        
                        Group {
                            if let imageClass = classifier.imageClass {
                                HStack{
                                    Text("Fruit:")
                                        .font(.caption)
                                    Text(imageClass)
                                        .bold()
                                }
                            } else {
                                HStack{
                                    Text("Fruit:")
                                        .font(.caption)
                                    Text("N/A")
                                        .font(.caption)
                                        .foregroundColor(.purple)
                                        .bold()
                                }
                            }
                        }
                        .font(.subheadline)
                        .padding()
                        
                    }
                }
                .sheet(isPresented: $isPresenting){
                    ImagePicker(uiImage: $uiImage, isPresenting:  $isPresenting, sourceType: $sourceType)
                        .onDisappear{
                            if uiImage != nil {
                                classifier.detect(uiImage: uiImage!)
                            }
                        }
                    
                }
                
            .padding()
            .navigationTitle("Fruit Recognition 📷")
            }
    }
}

struct FruitMLView_Previews: PreviewProvider {
    static var previews: some View {
        FruitMLView(classifier: ImageClassifier())
    }
}
