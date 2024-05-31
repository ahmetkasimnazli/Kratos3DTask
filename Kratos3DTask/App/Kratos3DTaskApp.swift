//
//  Kratos3DTaskApp.swift
//  Kratos3DTask
//
//  Created by Ahmet Kasım Nazlı on 31.05.2024.
//

import SwiftUI
import Firebase

@main
struct Kratos3DTaskApp: App {
    @StateObject private var viewModel: AuthViewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(.dark)
                .environmentObject(viewModel)
        }
        
    }
}
