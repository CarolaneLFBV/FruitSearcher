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
    @State private var description: String = ""
    @Binding var isPresented: Bool
    @FocusState private var isFocused: Bool
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    VStack {
                        
                        Text("Please enter the title and the time of your notification.")
                            .font(.subheadline)
                            
                        
                        VStack {
                            HStack {
                                TextField("Title", text: $title)
                                DatePicker("", selection: $date, displayedComponents: [.hourAndMinute])
                            }
                            .padding()
                            
                            TextField("Description...", text: $description)
                                .padding()
                        }
                        .background(colorScheme == .dark ? Color(UIColor.white).opacity(0.2) : Color(UIColor.lightGray).opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .focused($isFocused)
                        .onTapGesture {
                            isFocused = true
                        }
                        
                        Spacer()
                        
                        Button() {
                            let dateComponents = Calendar.current.dateComponents([.hour, .minute], from: date)
                            guard let hour = dateComponents.hour, let minute = dateComponents.minute else { return }
                            notificationManager.createLocalNotification(title: title, body: description, hour: hour, minute: minute) { error in
                                if error == nil {
                                    DispatchQueue.main.async {
                                        self.isPresented = false
                                    }
                                }
                            }
                        }label: {
                            Text("Create Notification")
                                .contentShape(Rectangle())
                                .buttonStyle(PlainButtonStyle())
                                .padding()
                                .frame(width: 200, height: 50)
                                .foregroundColor(colorScheme == .dark ? .white : .purple)
                                .background(colorScheme == .dark ? .purple : .white)
                                .clipShape(RoundedRectangle(cornerRadius: 100))
                        }
                       
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


