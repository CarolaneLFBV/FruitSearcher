//
//  FruitML.swift
//  FruitSearcher
//
//  Created by Carolane on 30/09/2022.
//

import SwiftUI

struct FruitML: View {
    // AI Settings
    @State var isPresenting: Bool = false
    @State var uiImage: UIImage?
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @ObservedObject var classifier: ImageClassifier
    
    var body: some View {
        NavigationView {
            VStack{
                HStack{
                    Image(systemName: "photo")
                        .onTapGesture {
                            isPresenting = true
                            sourceType = .photoLibrary
                        }
                        .foregroundColor(.blue)
                        .frame(width: 80, height: 25)
                        .padding(10)
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .shadow(color: .black, radius: 5, x: 3, y: 0)
                    
                    Image(systemName: "camera")
                        .onTapGesture {
                            isPresenting = true
                            sourceType = .camera
                        }
                        .foregroundColor(.blue)
                        .frame(width: 80, height: 25)
                        .padding(10)
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .shadow(color: .black, radius: 5, x: 3, y: 0)
                }
                .font(.title)

                Spacer()
                    .frame(height: 50)
                
                Rectangle()
                    .strokeBorder()
                    .frame(width: 250, height: 250)
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
                    Group {
                        if let imageClass = classifier.imageClass {
                            Text("Fruit: \(imageClass)")
                                .font(.system(size: 25, weight: .medium))

                        } else {
                            Text("Please add an image")
                                .font(.system(size: 25, weight: .medium))
                        }
                    }
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
            .navigationTitle("Fruit Recognition 📷")
            .padding()
        }
        .navigationViewStyle(.stack)
    }
}

struct FruitML_Previews: PreviewProvider {
    static var previews: some View {
        FruitML(classifier: ImageClassifier())
    }
}
