//
//  FindingViewModel.swift
//  PurrfectMatch
//
//  Created by CatMeox on 6/9/2566 BE.
//

import SwiftUI

class FindingViewModel: ObservableObject {
  @Published var fetchedUsers: [User] = []
  @Published var displayingUsers: [User]?
  
  init() {
    fetchedUsers = User.mockUsers
    displayingUsers = fetchedUsers
  }
  
  func like(user: User) {
    removeUser(user: user)
    //TODO
  }
  
  func dislike(user: User) {
    removeUser(user: user)
    //TODO
  }
  
  private func removeUser(user: User) {
    guard let index = displayingUsers?.firstIndex(of: user) else {
      return
    }
    
    displayingUsers?.remove(at: index)
  }
}
