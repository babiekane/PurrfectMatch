//
//  SignInViewModel.swift
//  PurrfectMatch
//
//  Created by CatMeox on 16/10/2566 BE.
//

import SwiftUI
import FirebaseAuth

class SignInViewModel: ObservableObject {
  @Published var email = ""
  @Published var password = ""
  @Published var showPassword = false
  
  @Published var isLoading = false
  @Published var isPresented = false
  @Published var showAlert = false
  
  init(onLoginSuccess: @escaping () -> Void, onPressSignup: @escaping () -> Void) {
    self.onLoginSuccess = onLoginSuccess
    self.onPressSignup = onPressSignup
  }
  
  let onLoginSuccess: () -> Void
  let onPressSignup: () -> Void
  
  @Published var errorMessage: String?
  
  private let auth = Auth.auth()
  
  func logIn(email: String, password: String) {
    if email.isEmpty || password.isEmpty {
      errorMessage = "Please fill email and password."
    } else {
      isLoading = true
      
      auth.signIn(withEmail: email, password: password) { [weak self] result, error in
        DispatchQueue.main.async {
          self?.isLoading = false
          
          if let error = error?.localizedDescription {
            self?.errorMessage = error
          } else {
            guard result != nil else {
              return
            }
            
            self?.onLoginSuccess()
          }
        }
      }
    }
  }
  
  func selectedSignup() {
    onPressSignup()
  }
}
