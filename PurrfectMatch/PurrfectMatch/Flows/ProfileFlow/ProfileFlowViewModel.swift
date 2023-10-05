//
//  ProfileFlowViewModel.swift
//  PurrfectMatch
//
//  Created by yossa on 5/10/2566 BE.
//

import SwiftUI

class ProfileFlowViewModel: ObservableObject {
  
  @Published var destinations: [ProfileFlowDestination] = []
  
  lazy var rootView: AnyView = {
    let viewModel = ProfileViewModel()
    viewModel.onMenuSelected = {
      self.navigateToSettings()
    }
    return AnyView(ProfileView(user: .mockUsers[0], viewModel: viewModel))
  }()
  
  func navigateToSettings() {
    let viewModel = ProfileSettingsViewModel()
    viewModel.onNameFormSelected = {
      self.navigateToNameForm()
    }
    
    viewModel.onGenderFormSelected = {
      self.navigateToGenderForm()
    }
    
    let user = User.mockUsers[0]
    let view = ProfileSettingsView(viewModel: viewModel, user: user)
    destinations.append(ProfileFlowDestination(view: AnyView(view)))
  }
  
  func navigateToNameForm() {
    let viewModel = ProfileViewModel()
    let view = NameView(viewModel: viewModel)
    destinations.append(ProfileFlowDestination(view: AnyView(view)))
  }
  
  func navigateToGenderForm() {
    let view = GenderView()
    destinations.append(ProfileFlowDestination(view: AnyView(view)))
  }
}

struct ProfileFlowDestination: Hashable {
  let id: UUID = UUID()
  let view: AnyView
  
  static func == (lhs: ProfileFlowDestination, rhs: ProfileFlowDestination) -> Bool {
    return lhs.id == rhs.id
  }

  func hash(into hasher: inout Hasher) {
    hasher.combine(id)
  }
}
