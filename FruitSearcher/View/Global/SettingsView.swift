//
//  SettingsView.swift
//  FruitSearcher
//
//  Created by Carolane on 07/10/2022.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        Form {
            Section {
                NavigationLink(destination: NotificationView()) {
                    Text("Gérer les notifications")
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
