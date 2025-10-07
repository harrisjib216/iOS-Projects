//
//  UsersView.swift
//  SwiftDataProject
//
//  Created by jibril harris on 6/6/25.
//

import SwiftData
import SwiftUI

struct UsersView: View {
    @Environment(\.modelContext) var modelContext
    @Query var users: [User]
    
    var body: some View {
        List(users) { user in
            NavigationLink(value: user) {
                HStack {
                    Text(user.name)
                    
                    Spacer()
                    
                    Text("\(user.jobs.count)")
                        .fontWeight(.black)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .background(.blue)
                        .foregroundStyle(.white)
                        .clipShape(.capsule)
                }
            }
            .navigationDestination(for: User.self) { user in
                EditUserView(user: user)
            }
        }
        .onAppear {
            addSample()
        }
    }
    
    init(minimumJoinDate: Date, sortOrder: [SortDescriptor<User>]) {
        _users = Query(
            filter: #Predicate<User> { user in
                user.joinDate >= minimumJoinDate
            },
            sort: sortOrder
        )
    }
    
    func addSample() {
        let user = User(name: "Piper Chapman", city: "New York", joinDate: .now)
        let job1 = Job(name: "Organize sock drawer", priority: 3)
        let job2 = Job(name: "Make plans with alex", priority: 4)
        
        modelContext.insert(user)
        user.jobs.append(job1)
        user.jobs.append(job2)
    }
}

//#Preview {
//    UsersView(
//        minimumJoinDate: .now,
//        sortOrder: [SortDescriptor(\User.name)]
//    )
//        .modelContainer(User.self)
//}
