//
//  HomeView.swift
//  Kratos3DTask
//
//  Created by Ahmet Kasım Nazlı on 31.05.2024.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        if let user = viewModel.currentUser {
            VStack {
                Spacer()
                Text("\(user.name) \(user.surname)")
                    .font(.title)
                    .foregroundStyle(.yellow)
                Spacer()
                Button {
                    Task {
                        viewModel.logOut()
                    }
                } label: {
                    Text("Logout")
                        .frame(maxWidth: .infinity, maxHeight: 40)
                        .foregroundStyle(.black)
                }
                .buttonStyle(.borderedProminent)
                .tint(.yellow)
                .font(.title2)
                .padding(.horizontal)
            }
            .ignoresSafeArea(edges: .horizontal)
            .background(.black)
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(AuthViewModel())
}
