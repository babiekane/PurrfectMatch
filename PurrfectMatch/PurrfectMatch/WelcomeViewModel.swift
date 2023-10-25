//
//  WelcomeViewModel.swift
//  PurrfectMatch
//
//  Created by CatMeox on 6/9/2566 BE.
//

import Foundation

class WelcomeViewModel: ObservableObject {
  
  var onSignupPressed: (() -> Void)?
  
  func pressSignup() {
    onSignupPressed?()
  }
}
