//
// LoginView.swift
// The dedicated login screen with secure error messaging.
//

import SwiftUI

struct LoginView: View {
    @Environment(\.dismiss) var dismiss
    @State private var emailInput: String = ""
    @State private var passwordInput: String = ""
    @State private var loginFailed: Bool = false
    @State private var navigateToInbox = false
    
    // MARK: - Hardcoded Credentials for MVP Demo
    private let correctEmail = "pejman@studenti.unina.it"
    private let correctPassword = "123456789" // This value is only used for comparison
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                
                // MARK: - Header (Blue Background & Manual Back Button)
                VStack(alignment: .leading) {
                    HStack {
                        // Back Button to HomeView
                        Button(action: {
                            dismiss()
                        }) {
                            Image(systemName: "chevron.left")
                                .font(.system(size: 24, weight: .bold))
                        }
                        Spacer()
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 15)
                    
                    Text("Student EMAIL")
                        .font(.system(size: 36, weight: .bold))
                        .padding(.horizontal, 20)
                        .padding(.top, 20)
                        .padding(.bottom, 50)
                }
                .foregroundColor(.white)
                .background(Color(hue: 0.57, saturation: 0.703, brightness: 0.357))
                .ignoresSafeArea(edges: .top)

                // MARK: - Login Form
                VStack(spacing: 30) {
                    
                    InputGroup(iconName: "at", placeholder: "ENTER EMAIL", text: $emailInput, isSecure: false)
                    InputGroup(iconName: "lock", placeholder: "ENTER PASSWORD", text: $passwordInput, isSecure: true)

                    // Error Message (Now Generic)
                    if loginFailed {
                        // FIX: Displays a generic error message
                        Text("Invalid email or password. Please try again.")
                            .foregroundColor(.red)
                            .font(.caption)
                            .multilineTextAlignment(.center)
                    }

                    // LOGIN Button with Hardcoded Validation
                    Button(action: {
                        // Check if the inputs match the specific credentials
                        if emailInput == correctEmail && passwordInput == correctPassword {
                            loginFailed = false
                            navigateToInbox = true // SUCCESS: Trigger navigation
                        } else {
                            loginFailed = true // FAILURE: Show generic error
                        }
                    }) {
                        Text("LOGIN")
                            .font(.system(size: 30, weight: .regular))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 8)
                            .background(Color(hue: 0.571, saturation: 0.71, brightness: 0.365))
                            .cornerRadius(15)
                            .shadow(color: Color.gray.opacity(0.7), radius: 5, x: 0, y: 4)
                    }
                    .padding(.horizontal, 85)
                    
                    Text("Your credentials will only be used to access your email inbox.")
                        .font(.caption)
                        .foregroundColor(Color(white: 0.602))
                        .multilineTextAlignment(.center)
                        .frame(width: 250)
                    
                }
                .padding(.top, 50)
                
                Spacer()
            }
            // Navigation Destination: Go to InboxView if successful
            .navigationDestination(isPresented: $navigateToInbox) {
                InboxView()
            }
            .navigationBarHidden(true)
            .background(Color.white.ignoresSafeArea())
        }
    }
}

// MARK: - Helper Struct (InputGroup remains the same)

struct InputGroup: View {
    var iconName: String
    var placeholder: String
    @Binding var text: String
    var isSecure: Bool
    
    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: iconName)
                .font(.system(size: 36))
                .foregroundColor(Color(hue: 0.571, saturation: 0.71, brightness: 0.365))
            
            VStack(alignment: .leading, spacing: 2) {
                Text(placeholder)
                    .font(.caption)
                    .foregroundColor(Color(white: 0.602))
                
                if isSecure {
                    SecureField("", text: $text)
                        .foregroundColor(.black)
                } else {
                    TextField("", text: $text)
                        .foregroundColor(.black)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                }
            }
            Spacer()
        }
        .padding(.horizontal, 30)
        .frame(height: 72)
        .background(Color.white)
        .cornerRadius(8)
        .shadow(color: Color.gray.opacity(0.3), radius: 5, x: 0, y: 4)
        .padding(.horizontal, 35)
    }
}
