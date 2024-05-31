//
//  RegisterView.swift
//  Kratos3DTask
//
//  Created by Ahmet Kasım Nazlı on 31.05.2024.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @Environment(\.dismiss) private var dismiss
    @State private var name: String = ""
    @State private var surname: String = ""
    @State private var emailAdress: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack {
            Text("Create Account")
                .font(.title)
                .foregroundStyle(.yellow)
            
            TextField("Name", text: $name)
                .padding()
                .background(Color("darkColor"))
                .cornerRadius(10)
            
            TextField("Surname", text: $surname)
                .padding()
                .background(Color("darkColor"))
                .cornerRadius(10)
            
            TextField("Email Adress", text: $emailAdress)
                .textInputAutocapitalization(.never)
                .keyboardType(.emailAddress)
                .padding()
                .background(Color("darkColor"))
                .cornerRadius(10)
            
            SecureField("Password", text: $password)
                .textInputAutocapitalization(.never)
                .padding()
                .background(Color("darkColor"))
                .cornerRadius(10)
            
            Spacer()
            
            Button {
                Task {
                    await viewModel.createUser(email: emailAdress, password: password, name: name, surname: surname)
                }
            } label: {
                Text("Create Account")
                    .frame(maxWidth: .infinity, maxHeight: 40)
                    .foregroundStyle(.black)
            }
            .buttonStyle(.borderedProminent)
            .tint(.yellow)
            .font(.title2)
            .foregroundColor(.black)
            Button {
                dismiss()
            } label: {
                Text("Cancel")
                    .frame(maxWidth: .infinity, maxHeight: 40)
            }
            
            .buttonStyle(.borderedProminent)
            .tint(.red)
            .font(.title2)
            
        }
        .padding()
        .ignoresSafeArea(edges: .horizontal)
        .background(.black)
        .navigationBarBackButtonHidden()
    }
    
}

#Preview {
    RegisterView()
        .environmentObject(AuthViewModel())
}
