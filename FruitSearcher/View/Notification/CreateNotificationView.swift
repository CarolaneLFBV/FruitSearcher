//
//  CreateNotificationView.swift
//  FruitSearcher
//
//  Created by Carolane on 07/10/2022.
//

import SwiftUI

struct CreateNotificationView: View {
    @ObservedObject var notificationManager: NotificationManager
    @State private var title: String = ""
    @State private var date = Date()
    @Binding var isPresented: Bool
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    VStack {
                        
                        Text("Please enter the title and the time of your notification.")
                            .font(.subheadline)
                        
                        HStack {
                            TextField("Notification Title", text: $title)
                            Spacer()
                            DatePicker("", selection: $date, displayedComponents: [.hourAndMinute])
                        }
                        .padding(.vertical, 8)
                        .padding(.horizontal, 12)
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                        Spacer()
                        
                        Button() {
                            let dateComponents = Calendar.current.dateComponents([.hour, .minute], from: date)
                            guard let hour = dateComponents.hour, let minute = dateComponents.minute else { return }
                            notificationManager.createLocalNotification(title: title, hour: hour, minute: minute) { error in
                                if error == nil {
                                    DispatchQueue.main.async {
                                        self.isPresented = false
                                    }
                                }
                            }
                        }label: {
                            Text("Create Notification")
                        }
                        .padding()
                        .frame(width: 200, height: 50)
                        .foregroundColor(.purple)
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 100))
                        .buttonStyle(PlainButtonStyle())
                    }
                    .listRowBackground(Color(.systemGroupedBackground))
                }
            }
            .onDisappear {
                notificationManager.reloadLocalNotifications()
            }
            .navigationTitle("Create a notification")
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button() {
                        isPresented = false
                    }label: {
                        Image(systemName: "xmark")
                            .imageScale(.large)
                            .foregroundColor(.purple)
                    }
                }
            })

        }
    }
}

struct CreateNotificationView_Previews: PreviewProvider {
    static var previews: some View {
        CreateNotificationView(notificationManager: NotificationManager(), isPresented: .constant(false))
    }
}


