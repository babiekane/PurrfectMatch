//
//  PurrfectMatchApp.swift
//  PurrfectMatch
//
//  Created by CatMeox on 5/9/2566 BE.
//

import SwiftUI
import Firebase

@main
struct PurrfectMatchApp: App {
  
  init() {
    FirebaseApp.configure()
  }
  
  var body: some Scene {
    WindowGroup {
      CurrentChatView(user: User.mockUsers[0])
//      WelcomeView()
    }
  }
}
