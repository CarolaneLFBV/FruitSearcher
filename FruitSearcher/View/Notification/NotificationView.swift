//
//  NotificationView.swift
//  FruitSearcher
//
//  Created by Carolane on 07/10/2022.
//

import SwiftUI

struct NotificationView: View {
    @StateObject private var notificationManager = NotificationManager()
    @State private var isCreatePresented: Bool = false
    
    @ViewBuilder
    var infoOverlayView: some View {
        switch notificationManager.authorizationStatus {
        case .authorized:
            if notificationManager.notifications.isEmpty {
                InfoOverlayView(
                    infoMessage: "Add a notification here",
                    buttonTitle: "Create notification",
                    systemImageName: "plus.circle",
                    action: {
                        isCreatePresented = true
                    })
            }
            
        case .denied:
            InfoOverlayView(infoMessage: "Please enable Notification Permission In Settings",
                            buttonTitle: "Settings",
                            systemImageName: "gear",
                            action: {
                if let url = URL(string: UIApplication.openSettingsURLString),
                   UIApplication.shared.canOpenURL(url) {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                }
            })
            
        default:
            EmptyView()
        }
    }
    
    var body: some View {
        List {
            ForEach(notificationManager.notifications, id:\.identifier) { notification in
                Text(notification.content.title)
                    .fontWeight(.semibold)
            }
            .onDelete(perform: delete)
        }
        .listStyle(InsetGroupedListStyle())
        .overlay(infoOverlayView)
        .navigationTitle("Notifications")
        .onAppear(perform: notificationManager.reloadAuthorizationStatus)
        .onChange(of: notificationManager.authorizationStatus) { authorizationStatus in
            switch authorizationStatus {
            case .notDetermined:
                notificationManager.requestAuthorization()
            case .authorized:
                notificationManager.reloadLocalNotifications()
            default:
                break
            }
        }
        .toolbar(content: {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button() {
                    isCreatePresented = true
                }label: {
                    Image(systemName: "plus.circle")
                        .imageScale(.large)
                        .foregroundColor(.purple)
                }
            }
        })
        .sheet(isPresented: $isCreatePresented) {
            NavigationStack {
                CreateNotificationView(
                    notificationManager: notificationManager,
                    isPresented: $isCreatePresented)
            }
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
            notificationManager.reloadAuthorizationStatus()
        }
    }
}


extension NotificationView {
    func delete(_ indexSet: IndexSet) {
        notificationManager.deleteLocalNotification (
            identifiers: indexSet.map {
                notificationManager.notifications[$0].identifier
            }
        )
        notificationManager.reloadLocalNotifications()
    }
}



struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
