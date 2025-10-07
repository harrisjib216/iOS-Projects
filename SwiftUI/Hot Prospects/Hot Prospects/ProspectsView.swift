//
//  ProspectsView.swift
//  Hot Prospects
//
//  Created by jibril harris on 6/23/25.
//

import CodeScanner
import SwiftUI
import SwiftData
import UserNotifications

struct ProspectsView: View {
    enum FilterType {
        case none, contacted, uncontacted
    }
    
    @Environment(\.modelContext) var modelContext
    @Query(sort: \Prospect.name) var prospects: [Prospect]
    @State private var showingScanner = false
    @State private var selectedProspects = Set<Prospect>()
    
    let filter: FilterType
    
    var title: String {
        switch filter {
        case .contacted:
            "Contacted people"
        case .uncontacted:
            "Uncontacted people"
        case .none:
            "Everyone"
        }
    }
    
    init(filter: FilterType) {
        self.filter = filter
        
        if filter != .none {
            let showContactedOnly = filter == .contacted
            
            _prospects = Query(filter: #Predicate {
                $0.isContacted == showContactedOnly
            }, sort: [SortDescriptor(\Prospect.name)])
        }
    }
    
    var body: some View {
        NavigationStack {
            List(prospects, selection: $selectedProspects) { prospect in
                VStack(alignment: .leading) {
                    Text(prospect.name)
                        .font(.headline)
                    
                    Text(prospect.email)
                        .foregroundStyle(.secondary)
                }
                .swipeActions {
                    Button("Delete", systemImage: "trash", role: .destructive) {
                        modelContext.delete(prospect)
                    }
                    
                    if prospect.isContacted {
                        Button("Mark as uncontacted", systemImage: "person.crop.circle.badge.xmark") {
                            prospect.isContacted = false
                        }
                        .tint(.blue)
                    } else {
                        Button("Mark as contacted", systemImage: "person.crop.circle.badge.checkmark") {
                            prospect.isContacted = true
                        }
                        .tint(.green)
                        
                        Button("Remind me", systemImage: "bell") {
                            addNotification(for: prospect)
                        }
                        .tint(.orange)
                    }
                }
                .tag(prospect)
            }
                .navigationTitle(title)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        EditButton()
                    }
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Scan", systemImage: "qrcode.viewfinder") {
                            showingScanner = true
                        }
                    }
                    
                    if selectedProspects.isEmpty == false {
                        ToolbarItem(placement: .bottomBar) {
                            Button("Deleted selected", action: delete)
                        }
                    }
                }
                .sheet(isPresented: $showingScanner) {
                    CodeScannerView(codeTypes: [.qr], simulatedData: "simulated person\nsimulatedperson@email.com", completion: handleScan)
                }
        }
    }
    
    func delete() {
        for prospect in selectedProspects {
            modelContext.delete(prospect)
        }
    }
    
    func handleScan(result: Result<ScanResult, ScanError>) {
        showingScanner = false
        
        switch result {
        case .success(let result):
            let details = result.string.components(separatedBy: "\n")
            guard details.count == 2 else { return }
            
            let prospect = Prospect(name: details[0], email: details[1], isContacted: false)
            modelContext.insert(prospect)
        case .failure(let error):
            print("scanning fail: \(error.localizedDescription)")
        }
    }
    
    func addNotification(for prospect: Prospect) {
        let center = UNUserNotificationCenter.current()
        
        let addRequest = {
            let content = UNMutableNotificationContent()
            content.title = "Contact \(prospect.name)"
            content.subtitle = prospect.email
            content.sound = UNNotificationSound.default
            
            var dateComponents = DateComponents()
            dateComponents.hour = 9
            
            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            
            center.add(request)
        }
        
        center.getNotificationSettings { settings in
            if settings.authorizationStatus == .authorized {
                addRequest()
            } else {
                center.requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        addRequest()
                    } else {
                        print("notif failed: \(error?.localizedDescription)")
                    }
                }
            }
        }
    }
}

#Preview {
    ProspectsView(
        filter: .none
    )
    .modelContainer(for: Prospect.self)
}


// ideas: Connectr
// list of people to contact
// bump to contact
    // leave a little note by them
    // send them your contact info with a little note
// set reminders to contact them
// place into groups


// real estate
// website developer
// hair vendor
