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
  var onBreedSelected: (() -> Void)?
  var onColorFormSelected: (() -> Void)?
  var onDatePickerSelected: (() -> Void)?
  var onWeightPickerSelected: (() -> Void)?
  
  func selectNameForm() {
    onNameFormSelected?()
  }
  
  func selectGenderForm() {
    onGenderFormSelected?()
  }
  
  func selectBreeds() {
    onBreedSelected?()
  }
  
  func selectColorForm() {
    onColorFormSelected?()
  }
  
  func selectDatePicker() {
    onDatePickerSelected?()
  }
  
  func selectWeightPickerView() {
    onWeightPickerSelected?()
  }
}
