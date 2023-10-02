//
//  MessageField.swift
//  PurrfectMatch
//
//  Created by CatMeox on 14/9/2566 BE.
//

import SwiftUI

struct MessageField: View {
  @EnvironmentObject var messagesManager: MessagesManager
  @State private var message = ""
  
  var body: some View {
    HStack {
      Button {
        
      } label: {
        Image(systemName: "camera.fill")
          .font(.title2)
          .foregroundColor(Color("Lilac"))
      }
      
      Button {
        
      } label: {
        Image(systemName: "face.smiling.inverse")
          .font(.title2)
          .foregroundColor(Color("Lilac"))
      }
      
      CustomTextField(placeholder: Text("Aa"), text: $message)
        .padding(.horizontal)
        .padding(.vertical, 10)
        .background(Color("Lilac").opacity(0.2))
        .cornerRadius(25)
      
      Button {
        messagesManager.sendMessage(text: message)
        message = ""
      } label: {
        Image(systemName: "paperplane.fill")
          .font(.title2)
          .foregroundColor(Color("Lilac"))
      }
    }
    .padding()
    .background(Color("White"))
  }
}

struct MessageField_Previews: PreviewProvider {
  static var previews: some View {
    MessageField()
      .environmentObject(MessagesManager())
  }
}

struct CustomTextField: View {
  var placeholder: Text
  @Binding var text: String
  var editingChanged: (Bool) -> () = {_ in}
  var commit: () -> () = {}
  
  var body: some View {
    ZStack(alignment: .leading) {
      if text.isEmpty {
        placeholder
          .opacity(0.5)
      }
      
      TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
    }
  }
}
