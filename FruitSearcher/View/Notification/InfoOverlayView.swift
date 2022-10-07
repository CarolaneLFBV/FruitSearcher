//
//  InfoOverlayView.swift
//  FruitSearcher
//
//  Created by Carolane on 07/10/2022.
//

import SwiftUI

struct InfoOverlayView: View {
    let infoMessage: String
    let buttonTitle: String
    let systemImageName: String
    let action: () -> Void
    
    var body: some View {
        VStack {
            Text(infoMessage)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.center)
            
            Button {
                action()
            } label: {
                Label(buttonTitle, systemImage: systemImageName)
            }
            .padding()
            .backgroundStyle(Color(.systemGray5))
            .cornerRadius(5)
        }
    }
}

struct InfoOverlayView_Previews: PreviewProvider {
    static var previews: some View {
        InfoOverlayView(infoMessage: "", buttonTitle: "", systemImageName: "", action: {})
    }
}
