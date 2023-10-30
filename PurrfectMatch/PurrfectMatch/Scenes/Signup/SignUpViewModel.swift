//
//  AuthViewModel.swift
//  PurrfectMatch
//
//  Created by CatMeox on 3/10/2566 BE.
//

import Foundation

class SignUpViewModel: ObservableObject {
  @Published var email = ""
  @Published var password = ""
  @Published var showPassword = false
  
  var onSignInSelected: (() -> Void)?
  
  func selectSignIn() {
    onSignInSelected?()
  }
}
