//
//  LoginView.swift
//  Kratos3DTask
//
//  Created by Ahmet Kasım Nazlı on 31.05.2024.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var emailAdress: String = ""
    @State private var password: String = ""
    @State private var isRememberMe: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .offset(y: -100)
                    .padding()
                Spacer()
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
                
                HStack {
                    Image(systemName: isRememberMe ? "checkmark.square" : "square")
                        .foregroundColor(.white)
                    Button("Remember Me") {
                        isRememberMe.toggle()
                    }
                    .tint(.gray)
                    Spacer()
                    Button("Forgot Password") {
                        print("Forgot Password")
                    }
                    .tint(.yellow)
                }
                .padding(.bottom)
                Button {
                    Task {
                        await viewModel.logIn(email: emailAdress, password: password)
                    }
                } label: {
                    Text("Login")
                        .frame(maxWidth: .infinity, maxHeight: 40)
                        .foregroundColor(.black)
                }
                .buttonStyle(.borderedProminent)
                .tint(.yellow)
                .font(.title2)
                HStack {
                    Text("Don't have an account?")
                        .foregroundColor(.gray)
                    NavigationLink {
                        RegisterView()
                    } label: {
                        Text("Create One")
                            .foregroundColor(.yellow)
                    }
                }
            }
            .padding()
            .background(
                Image("Background")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all))
        }
    }
}


#Preview {
    LoginView()
        .environmentObject(AuthViewModel())
}
