//
//  ProfileViewModel.swift
//  PurrfectMatch
//
//  Created by CatMeox on 6/9/2566 BE.
//

import Foundation

class ProfileViewModel: ObservableObject {
  @Published var name = ""
  @Published var selectedSex = "Male"
  @Published var sex = ["Male", "Female"]
  @Published var dateOfBirth: Date = Date()
  @Published var selectedBreed = "American Shorthair"
  @Published var breeds = [String]()
  @Published var color = ""
  @Published var about = ""
  @Published var profilePicture = "Regdoll1"
  
  init() {
    loadCatBreeds()
  }
  
  func loadCatBreeds()  {
    guard let url = Bundle.main.url(forResource: "cat-breeds", withExtension: "json") else {
      print("Json file not found")
      return
    }
    
    let data = try? Data(contentsOf: url)
    let breeds = try? JSONDecoder().decode([String].self, from: data!)
    self.breeds = breeds!
  }
}
