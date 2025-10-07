//
//  ContentView.swift
//  SwiftDataProject
//
//  Created by jibril harris on 5/19/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
//    @Query(
//        filter: #Predicate<User> { user in
//            user.name.localizedCaseInsensitiveContains("")
//        },
//        sort: \User.name
//    ) var users: [User]
    
    @State private var path = [User]()
    @State private var nameFilter = ""
    @State private var showingUpcomingOnly = false
    @State private var sortOrder = [
        SortDescriptor(\User.name),
        SortDescriptor(\User.joinDate)
    ]
    
    var body: some View {
        NavigationStack(path: $path) {
//            List(users) { user in
//                NavigationLink(value: user) {
//                    Text(user.name)
//                }
//            }
            UsersView(
                minimumJoinDate: showingUpcomingOnly ? .now : .distantPast,
                sortOrder: sortOrder
            )
            .navigationTitle("Users")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(showingUpcomingOnly ? "Show all" : "Show upcoming") {
                        showingUpcomingOnly.toggle()
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Menu("Sort", systemImage: "arrow.up.arrow.down") {
                        Picker("Sort", selection: $sortOrder) {
                            Text("Sort by name")
                                .tag([
                                    SortDescriptor(\User.name),
                                ])
                            
                            Text("Sort by join date")
                                .tag([
                                    SortDescriptor(\User.joinDate),
                                ])
                        }
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add user", systemImage: "plus") {
                        let user = User(name: "", city: "", joinDate: .now)
                        modelContext.insert(user)
                        
                        path = [user]
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
