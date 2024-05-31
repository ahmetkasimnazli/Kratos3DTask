//
//  ContentView.swift
//  Kratos3DTask
//
//  Created by Ahmet Kasım Nazlı on 31.05.2024.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var showLaunchView: Bool = true
    
    var body: some View {
        ZStack{
            if showLaunchView {
                LaunchView()
                    .transition(.opacity)
            } else {
                Group {
                    if viewModel.userSession != nil {
                        HomeView()
                    } else {
                        LoginView()
                    }
                }
            }
        }
        .onAppear() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                withAnimation {
                    showLaunchView = false
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(AuthViewModel())
}
