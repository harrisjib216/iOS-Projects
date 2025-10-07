//
//  ContentView.swift
//  Hot Prospects
//
//  Created by jibril harris on 6/19/25.
//

import SwiftUI
import UserNotifications

struct Notifs: View {
    
    var body: some View {
        VStack {
            Button("request perms") {
                requestParams()
            }
            
            Button("schedule notifs") {
                scheduleParams()
            }
        }
    }
    
    func requestParams() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                print("good to go")
            }
            
            if error != nil {
                print(error?.localizedDescription)
            }
        }
    }
    
    func scheduleParams() {
        let content = UNMutableNotificationContent()
        content.title = "Feed cat"
        content.subtitle = "Do it now"
        content.sound = .default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
}

#Preview {
    Notifs()
}
