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
    
    viewModel.onBreedSelected = {
      self.navigateToBreedForm()
    }
    
    viewModel.onColorFormSelected = {
      self.navigateToColorForm()
    }
    
    viewModel.onDatePickerSelected = {
      self.navigateToDatePickerForm()
    }
    
    viewModel.onWeightPickerSelected = {
      self.navigateToWeightPickerForm()
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
  
  func navigateToBreedForm() {
    let viewModel = ProfileViewModel()
    let view = BreedsView(viewModel: viewModel)
    destinations.append(ProfileFlowDestination(view: AnyView(view)))
  }
  
  func navigateToColorForm() {
    let viewModel = ProfileViewModel()
    let view = ColorView(viewModel: viewModel)
    destinations.append(ProfileFlowDestination(view: AnyView(view)))
  }
  
  func navigateToDatePickerForm() {
    let view = AgeView()
    destinations.append(ProfileFlowDestination(view: AnyView(view)))
  }
  
  func navigateToWeightPickerForm() {
    let view = WeightPickerView()
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
