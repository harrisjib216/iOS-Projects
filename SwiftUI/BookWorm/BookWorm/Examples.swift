//
//  ContentView.swift
//  BookWorm
//
//  Created by jibril harris on 5/16/25.
//

import SwiftData
import SwiftUI

/*
 binding: for values (struct, boolean, string, float)
    - lets us share a 2 way binding of a value object
 
 bindable: for referrences (classes)
    - let's us share a 2 way binding or a data object
 */
//struct PushButton: View {
//    let title: String
//    
//    // shares a 2 way
//    @Binding var isOn: Bool
//    
//    var onColors = [Color.red, Color.yellow]
//    var offColors = [Color(white: 0.6), Color(white: 0.4)]
//    
//    var body: some View {
//        Button(title) {
//            isOn.toggle()
//        }
//        .padding()
//        .background(LinearGradient(colors: isOn ? onColors : offColors, startPoint: .top, endPoint: .bottom))
//        .foregroundStyle(.white)
//        .clipShape(.capsule)
//        .shadow(radius: isOn ? 0 : 5)
//    }
//}
//
//struct ContentView: View {
//    @State private var rememberMe = false
//    var body: some View {
//        VStack {
//            PushButton(title: "remember me", isOn: $rememberMe)
//            Text(rememberMe ? "on" : "off")
//        }
//        .padding()
//    }
//}



//struct ContentView: View {
//    @AppStorage("notes") private var notes = ""
//    
//    var body: some View {
//        NavigationStack {
//            VStack {
//                Form {
//                    // TextEditor(text: $notes)
//                    // .padding()
//                    
//                    TextField("Enter some text", text: $notes, axis: .vertical)
//                        .textFieldStyle(.roundedBorder)
//                        .padding()
//                }
//                    
//            }
//            .navigationTitle("Notes")
//        }
//    }
//}


//struct ContentView: View {
//    @Environment(\.modelContext) var modelContext
//    @Query var students: [Student]
//
//    var body: some View {
//        NavigationStack {
//            List(students) { student in
//                Text(student.name)
//                    
//            }
//            .navigationTitle("Classroom")
//            .toolbar {
//                Button("add") {
//                    let firstNames = ["jimmy", "jay", "swift"]
//                    let lastNames = ["jackson", "vermin", "garmin"]
//                    
//                    let newStudent = Student(id: UUID(), name: firstNames.randomElement()! + " " + lastNames.randomElement()!)
//                    
//                    modelContext.insert(newStudent)
//                }
//            }
//        }
//    }
//}


struct ExampleView: View {
    @Environment(\.modelContext) var modelContext

    var body: some View {
        NavigationStack {
            
        }
    }
}

