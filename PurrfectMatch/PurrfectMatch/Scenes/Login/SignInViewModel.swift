//
//  SignInViewModel.swift
//  PurrfectMatch
//
//  Created by yossa on 30/10/2566 BE.
//

import Foundation

class SignInViewModel: ObservableObject {
  @Published var email = ""
  @Published var password = ""
  @Published var showPassword = false
}
