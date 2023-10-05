//
//  ProfileSettingsViewModel.swift
//  PurrfectMatch
//
//  Created by yossa on 5/10/2566 BE.
//

import Foundation

class ProfileSettingsViewModel: ObservableObject {
  var onNameFormSelected: (() -> Void)?
  var onGenderFormSelected: (() -> Void)?
  
  func selectNameForm() {
    onNameFormSelected?()
  }
  
  func selectGenderForm() {
    onGenderFormSelected?()
  }
}
