//
//  ChatListViewModel.swift
//  PurrfectMatch
//
//  Created by CatMeox on 6/9/2566 BE.
//

import SwiftUI

class ChatListViewModel: ObservableObject {
  @Published var fetchedUsers: [User] = []
  @Published var displayingUsers: [User]?
  
  var onChatSelected: (() -> Void)?
  
  init() {
    fetchedUsers = User.mockUsers
    displayingUsers = fetchedUsers
  }
  
  func selectChat() {
    onChatSelected?()
  }
}
