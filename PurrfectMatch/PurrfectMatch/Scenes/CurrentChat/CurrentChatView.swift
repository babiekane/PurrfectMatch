//
//  CurrentChatView.swift
//  PurrfectMatch
//
//  Created by CatMeox on 6/9/2566 BE.
//

import SwiftUI

struct CurrentChatView: View {
  @StateObject var messagesManager = MessagesManager()
  var user: User
  
  var body: some View {
    ZStack {
      Image("Background")
        .resizable()
        .scaledToFill()
        .ignoresSafeArea()
      
      VStack {
        VStack {
          TitleRowView(user: user)
          
          ScrollViewReader { proxy in
            ScrollView {
              ForEach(messagesManager.messages, id: \.id) { message in
                MessageBubble(message: message)
              }
            }
            .padding(.top, 10)
            .onChange(of: messagesManager.lastMessageId) { id in
              withAnimation {
                proxy.scrollTo(id, anchor: .bottom)
              }
            }
          }
        }
        
        MessageField()
          .environmentObject(messagesManager)
          .padding(.bottom, 20)
      }
      
    }
  }
}

struct CurrentChatView_Previews: PreviewProvider {
  static var previews: some View {
    CurrentChatView(user: User.mockUsers[0])
  }
}
