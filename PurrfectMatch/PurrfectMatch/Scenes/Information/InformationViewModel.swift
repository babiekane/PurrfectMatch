//
//  InformationViewModel.swift
//  PurrfectMatch
//
//  Created by CatMeox on 6/9/2566 BE.
//

import Foundation

class InformationViewModel: ObservableObject {
  
  @Published var user: User?
  @Published var isLoading = false
  
  let userLoader = UserLoader()
  
  func fetchUser() async {
    user = try? await userLoader.loadUser(id: "dfzPdUpfR7eiDQJJxUhr")
  }
}
