//
//  SettingsView.swift
//  FruitSearcher
//
//  Created by Carolane on 07/10/2022.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationStack {
            Form {
                Section("Notifications Settings") {
                    NavigationLink(destination: NotificationView()) {
                        Text("Notifications 🔔")
                    }
                }
                
                Section("App Information") {
                    Text("Version: v1.0.0")
                    Text("Author: CarolaneLFBV")
                        .foregroundColor(Color(UIColor.lightGray))
                }
            }
            .navigationTitle("Settings ⚙️")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
