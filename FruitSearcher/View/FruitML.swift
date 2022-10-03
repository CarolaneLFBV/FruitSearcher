//
//  FruitML.swift
//  FruitSearcher
//
//  Created by Carolane on 30/09/2022.
//

import SwiftUI

struct FruitML: View {
    @State var isPresenting: Bool = false
    @State var uiImage: UIImage?
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    @ObservedObject var classifier: ImageClassifier
    
    var body: some View {
        NavigationStack {
                VStack{
                    HStack{
                        Image(systemName: "photo")
                            .frame(width: 80, height: 50)
                            .foregroundColor(Color("ColorPurple"))
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .shadow(color: .black, radius: 3, x: 0, y:0 )
                            .onTapGesture {
                                isPresenting = true
                                sourceType = .photoLibrary
                            }
                        
                        Image(systemName: "camera")
                            .frame(width: 80, height: 50)
                            .foregroundColor(Color("ColorPurple"))
                            .background(.white)
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
                    
                    Text("Please take or add any picture.")
                        .font(.caption)
                    
                    Rectangle()
                        .strokeBorder()
                        .foregroundColor(.white)
                        .overlay(
                            Group {
                                if uiImage != nil {
                                    Image(uiImage: uiImage!)
                                        .resizable()
                                        .scaledToFit()
                                }
                            }
                        )
                    
                    VStack{
                        Button(action: {
                            if uiImage != nil {
                                classifier.detect(uiImage: uiImage!)
                            }
                        }) {
                            Image(systemName: "magnifyingglass")
                                .font(.title)
                                .foregroundColor(Color("ColorPurple"))
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
                                        .foregroundColor(Color("ColorPurple"))
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
        .navigationBarTitleDisplayMode(.inline)
            }
    }
}

struct FruitML_Previews: PreviewProvider {
    static var previews: some View {
        FruitML(classifier: ImageClassifier())
    }
}
