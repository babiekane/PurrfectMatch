//
//  ChatFlowViewModel.swift
//  PurrfectMatch
//
//  Created by CatMeox on 6/10/2566 BE.
//

import SwiftUI

class ChatFlowViewModel: ObservableObject {
  @Published var destinations: [ChatFlowDestination] = []
  
  lazy var rootView: AnyView = {
    let viewModel = ChatListViewModel()
    viewModel.onChatSelected = {
      self.navigateToSelectedChat()
    }
    return AnyView(ChatListView(viewModel: viewModel))
  }()
  
  func navigateToSelectedChat() {
    let view = CurrentChatView(user: .mockUsers[0])
    destinations.append(ChatFlowDestination(view: AnyView(view)))
  }
}

struct ChatFlowDestination: Hashable {
  let id: UUID = UUID()
  let view: AnyView
  
  static func == (lhs: ChatFlowDestination, rhs: ChatFlowDestination) -> Bool {
    return lhs.id == rhs.id
  }

  func hash(into hasher: inout Hasher) {
    hasher.combine(id)
  }
}
