//
// HomeView.swift
// The fully implemented HomeView with Grid and Tab Bar.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showingLogin = false
    // State variable for tracking login status
    
    var body: some View {
        TabView {
            
            // MARK: - 1. Home Tab Content
            NavigationStack {
                VStack(spacing: 0) {
                    
                    // MARK: - Custom Header (Settings/Profile)
                    VStack(spacing: 0) {
                        HStack {
                            // Top Left Icon: Settings (Gear)
                            Image(systemName: "gearshape.fill")
                                .font(.title2)
                                .padding(.leading, 15)
                            
                            Spacer()
                            
                            // Top Right Icon: Profile (Person)
                            // The Notification icon has been removed from this view.
                            Image(systemName: "person.circle.fill")
                                .font(.title2)
                                .padding(.trailing, 15)
                        }
                        // INCREASED PADDING: Pushing the top icons down to clear the status bar (phone clock area)
                        .padding(.top, 40)
                        .padding(.bottom, 10)
                        
                        // NOTE: The HACK for time/5G/battery has been REMOVED here.
                    }
                    .foregroundColor(.white)
                    // Use the consistent blue color for the background
                    .background(Color(hue: 0.57, saturation: 0.703, brightness: 0.357))
                    .ignoresSafeArea(edges: .top)
                    
                    // MARK: - Main Grid Content
                    ScrollView {
                        LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: 20) {
                            
                            DashboardButton(title: "Student EMAIL", icon: "doc.text.fill", destination: .login, showingLogin: $showingLogin)
                            DashboardButton(title: "Dashboard", icon: "doc.text.fill", destination: .placeholder)
                            DashboardButton(title: "800 Anni UNINA", icon: "link", destination: .placeholder)
                            
                            DashboardButton(title: "Area Riservata", icon: "link", destination: .placeholder)
                            DashboardButton(title: "Links", icon: "globe", destination: .placeholder)
                            DashboardButton(title: "Courses", icon: "books.vertical.fill", destination: .placeholder)
                            
                            DashboardButton(title: "Social", icon: "person.3.fill", destination: .placeholder)
                            DashboardButton(title: "About", icon: "info.circle.fill", destination: .placeholder)
                            DashboardButton(title: "Segnalazioni", icon: "link", destination: .placeholder)
                            
                        }
                        .padding()
                        .padding(.top, 20)
                    }
                    .background(Color.white)
                    
                }
                .navigationTitle("")
                .navigationBarHidden(true)
                
                .navigationDestination(isPresented: $showingLogin) {
                    LoginView()
                }
            }
            .tabItem {
                Label("Home", systemImage: "house.fill")
            }
            
            // MARK: - Other Tabs (Unchanged)
            Text("Exams Calendar Content")
                .tabItem {
                    Label("Exams calendar", systemImage: "calendar")
                }
            
            Text("Transcript Content")
                .tabItem {
                    Label("Transcript", systemImage: "newspaper.fill")
                }
            
            Text("University Content")
                .tabItem {
                    Label("University", systemImage: "building.columns.fill")
                }
        }
    }
}

// MARK: - Helper Views (Unchanged)

enum DestinationType {
    case login
    case placeholder
}

struct DashboardButton: View {
    let title: String
    let icon: String
    let destination: DestinationType
    var showingLogin: Binding<Bool>? = nil
    
    private let iconColor = Color(hue: 0.57, saturation: 0.8, brightness: 0.3)
    
    var body: some View {
        Button(action: {
            if destination == .login {
                showingLogin?.wrappedValue = true
            } else {
                print("\(title) tapped")
            }
        }) {
            VStack(spacing: 8) {
                Image(systemName: icon)
                    .font(.largeTitle)
                    .foregroundColor(iconColor)
                
                Text(title)
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(iconColor)
                    .multilineTextAlignment(.center)
            }
            .padding(.vertical, 15)
            .frame(width: 100, height: 100)
            .background(Color.white)
            .cornerRadius(15)
            .shadow(color: Color.gray.opacity(0.3), radius: 5, x: 0, y: 3)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(iconColor.opacity(0.2), lineWidth: 1)
            )
        }
    }
}
