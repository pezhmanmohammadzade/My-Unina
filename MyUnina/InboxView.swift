// InboxView.swift

import SwiftUI

// NOTE: IncomingMailView, CustomTabBar, TabBarItem are now defined in IncomingMailView.swift

struct InboxView: View {
    @State private var searchText: String = ""
    @State private var isNotificationActive: Bool = true
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // MARK: - Custom Header (Blue Background)
                VStack(spacing: 0) {
                    HStack {
                        Image(systemName: "gearshape.fill")
                            .font(.title2)
                            .padding(.leading, 15)
                        
                        Spacer()
                        
                        Image(systemName: "person.circle.fill")
                            .font(.title2)
                            .padding(.trailing, 15)
                    }
                    .padding(.top, 40)
                    
                    // MARK: - Inbox Title and Notification Icon
                    HStack {
                        Spacer()
                        HStack(alignment: .lastTextBaseline, spacing: 5) {
                            Text("Inbox")
                                .font(.system(size: 30, weight: .bold))
                            Image(systemName: isNotificationActive ? "bell.fill" : "bell.slash.fill")
                                .font(.system(size: 22))
                                .onTapGesture {
                                    isNotificationActive.toggle()
                                }
                        }
                        Spacer()
                    }
                    .padding(.top, 10)
                    .padding(.bottom, 10) // Padding removed from here and moved below the search bar
                    
                    // MARK: - Search Bar (NEW POSITION: Exactly under "Inbox" title)
                    HStack {
                        Image(systemName: "magnifyingglass").foregroundColor(.gray)
                        TextField("Search", text: $searchText)
                    }
                    .padding(8)
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 15) // Padding below the search bar to space it from the list
                    
                } // End of inner VStack (Header)
                .foregroundColor(.white)
                .background(Color(hue: 0.57, saturation: 0.703, brightness: 0.357))
                .ignoresSafeArea(edges: .top)
                
                // MARK: - Inbox List Content
                ScrollView {
                    VStack(spacing: 1) {
                        // NAVIGATION LINKS (Require IncomingMailView definition elsewhere)
                        NavigationLink(destination: IncomingMailView()) {
                            InboxRow(sender: "Segreteria Studenti", subject: "Exam Sessions: New Dates", preview: "We would like to formally inform all registered ...", isUnread: true)
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        // ... other NavigationLinks ...
                        
                        NavigationLink(destination: IncomingMailView()) {
                            InboxRow(sender: "Prof. Rossi", subject: "Teaching Material Lesson 5", preview: "", isUnread: false)
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        NavigationLink(destination: IncomingMailView()) {
                            InboxRow(sender: "Tiroioni & Placement", subject: "Eventi Unina", preview: "", isUnread: false)
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        NavigationLink(destination: IncomingMailView()) {
                            InboxRow(sender: "Oraio Lezzioni", subject: "Lessons timetable", preview: "", isUnread: false)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                    .padding(.top, 5)
                    .background(Color.white)
                }
                Spacer()
            }
            .navigationBarHidden(true)
            .background(Color.white.ignoresSafeArea())
        }
    }
}

// MARK: - Helper Struct for Email Rows (InboxRow Definition)
struct InboxRow: View {
    let sender: String
    let subject: String
    let preview: String
    let isUnread: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack(spacing: 5) {
                if isUnread { Circle().fill(Color.blue).frame(width: 8, height: 8).offset(y: -2) }
                VStack(alignment: .leading, spacing: 2) {
                    Text(sender).font(.system(size: 18, weight: .bold)).foregroundColor(.primary)
                    Text(subject).font(.system(size: 16, weight: .regular)).foregroundColor(.primary)
                    if !preview.isEmpty { Text(preview).font(.system(size: 14, weight: .regular)).foregroundColor(.gray).lineLimit(1) }
                }
            }
            .padding([.leading, .trailing], 20)
            .padding(.vertical, 10)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.white)
        // Line divider remains removed as requested previously
    }
}
