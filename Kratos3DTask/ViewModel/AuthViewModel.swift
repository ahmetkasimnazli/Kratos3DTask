//
//  AuthViewModel.swift
//  Kratos3DTask
//
//  Created by Ahmet Kasım Nazlı on 31.05.2024.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

@MainActor
final class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    init() {
        userSession = Auth.auth().currentUser // if there is a user logged in, it will be assigned to userSession
        Task {
            await fetchUser()
        }
    }
    
    func logIn(email: String, password: String) async {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            userSession = result.user
            await fetchUser()
        } catch {
            debugPrint("DEBUG: Failed to login with error. \(error.localizedDescription)")
        }
    }
    
    func createUser(email: String, password: String, name: String, surname: String) async {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            userSession = result.user
            let user = User(id: result.user.uid, name: name, surname: surname, email: email)
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
            await fetchUser()
        } catch {
            debugPrint("DEBUG: Failed to create user with error. \(error.localizedDescription)")
        }
    }
    
    func logOut() {
        do {
            try Auth.auth().signOut() // logs out user on backend
            userSession = nil // wipes out user session and takes us back to login screen
            currentUser = nil // wipes out current user
        } catch {
            debugPrint("DEBUG: Error signing out... \(error.localizedDescription)")
        }
    }
    
    func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else { return }
        currentUser = try? snapshot.data(as: User.self)
        
        debugPrint("DEBUG: Current user is: \(currentUser?.name ?? "No user")")
    }
}
