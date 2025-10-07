//
//  EditUserView.swift
//  SwiftDataProject
//
//  Created by jibril harris on 5/19/25.
//

import SwiftUI
import SwiftData

struct EditUserView: View {
    @Bindable var user: User
    
    var body: some View {
        Form {
            TextField("Name", text: $user.name)
            TextField("City", text: $user.city)
            DatePicker("Join date", selection: $user.joinDate)
        }
        .navigationTitle("Edit user")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: User.self, configurations: config)
        
        let user = User(name: "Jib", city: "NYC", joinDate: .now)
        
        return EditUserView(user: user)
            .modelContainer(container)
    } catch {
        return Text("Failed to load user: \(error.localizedDescription)")
    }
}
