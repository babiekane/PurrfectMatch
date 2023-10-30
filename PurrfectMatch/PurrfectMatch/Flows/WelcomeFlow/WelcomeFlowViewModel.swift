//
//  WelcomeFlowViewModel.swift
//  PurrfectMatch
//
//  Created by yossa on 25/10/2566 BE.
//

import SwiftUI

class WelcomeFlowViewModel: ObservableObject {
  
  var view: AnyView {
    currentView ?? rootView
  }
  
  @Published private var currentView: AnyView?
  
  private lazy var rootView: AnyView = {
    let viewModel = WelcomeViewModel()
    viewModel.onSignupPressed = { [weak self] in
      self?.navigateToSignup()
    }
    let view = WelcomeView(viewModel: viewModel)
    return AnyView(view)
  }()
  
  func navigateToWelcome() {
    currentView = rootView
  }
  
  func navigateToLogin() {
    let viewModel = SignInViewModel()
    let view = SignInView(viewModel: viewModel)
    currentView = AnyView(view)
  }
  
  func navigateToSignup() {
    let viewModel = SignUpViewModel()
    viewModel.onSignInSelected = { [weak self] in
      self?.navigateToLogin()
    }
    let view = SignUpView(viewModel: viewModel)
    currentView = AnyView(view)
  }
}
