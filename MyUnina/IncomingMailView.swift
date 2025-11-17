// IncomingMailView.swift (Updated - Footer/CustomTabBar Removed)

import SwiftUI

// MARK: - IncomingMailView Definition (The Full Email Detail View)

struct IncomingMailView: View {
    // Required state variable for bookmark functionality
    @State private var isBookmarked: Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
            
            // MARK: - Custom Header (Blue Background)
            VStack(spacing: 0) {
                HStack {
                    Image(systemName: "gearshape.fill").font(.title2).padding(.leading, 15)
                    Spacer()
                    Image(systemName: "person.circle.fill").font(.title2).padding(.trailing, 15)
                }
                .padding(.top, 40)
                
                Text("Incoming mail").font(.system(size: 24, weight: .bold)).padding(.vertical, 10)
            }
            .foregroundColor(.white)
            .background(Color(hue: 0.57, saturation: 0.703, brightness: 0.357))
            .ignoresSafeArea(edges: .top)
            
            // MARK: - Scrollable Email Content
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // ... (Email content implementation as previously verified) ...
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Segreteria Studenti").font(.headline).fontWeight(.bold)
                        Text("Exam Sessions: New Dates").font(.title2).fontWeight(.bold)
                        Text("We inform you that you are giving appeals...").font(.subheadline).foregroundColor(.gray)
                    }
                    .padding(.horizontal, 20).padding(.top, 15)
                    
                    Divider().padding(.horizontal, 20)
                    
                    HStack(alignment: .top, spacing: 10) {
                        Circle().fill(Color.blue).frame(width: 40, height: 40).overlay(Text("S").foregroundColor(.white).font(.headline))
                        VStack(alignment: .leading) {
                            Text("Respioiss:").font(.subheadline).fontWeight(.bold)
                            Text("Today at 10:30").font(.caption).foregroundColor(.gray)
                        }
                        Spacer()
                    }
                    .padding(.horizontal, 20)
                    
                    Text("We would like to formally inform all registered students that the previously scheduled dates for the exam sessions pertaining to the autumn session have been officially postponed due to necessary logistical and organizational adjustments. The new scheduling will be announced through official university channels as soon as possible.")
                        .font(.body).lineSpacing(4).padding(.horizontal, 20)
                    
                    // MARK: - Action Buttons
                    HStack(spacing: 40) {
                        Spacer()
                        Image(systemName: "arrowshape.turn.up.left.fill").font(.title2).foregroundColor(.black)
                        Image(systemName: "arrowshape.turn.up.right.fill").font(.title2).foregroundColor(.black)
                        
                        // Bookmark Toggle Button
                        Image(systemName: isBookmarked ? "bookmark.fill" : "bookmark").font(.title2).foregroundColor(isBookmarked ? .blue : .black)
                            .onTapGesture { isBookmarked.toggle() }
                        
                        Spacer()
                    }
                    .padding(.vertical, 10)
                }
                .frame(maxWidth: .infinity)
                .background(Color.white)
            }
            
            Spacer(minLength: 0)
        }
        .background(Color.white.ignoresSafeArea())
        .navigationBarHidden(true)
        // NOTE: .overlay(alignment: .bottom) { CustomTabBar() } HAS BEEN REMOVED
    }
}
// NOTE: CustomTabBar and TabBarItem structs should also be removed from their file
// if they are not used elsewhere.
