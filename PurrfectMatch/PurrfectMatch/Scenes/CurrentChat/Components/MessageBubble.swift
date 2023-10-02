//
//  MessageBubble.swift
//  PurrfectMatch
//
//  Created by CatMeox on 14/9/2566 BE.
//

import SwiftUI

struct MessageBubble: View {
  var message: Message
  @State private var showTime = false
  
  var body: some View {
    VStack(alignment: message.received ? .leading : .trailing) {
      HStack {
        Text(message.text)
          .padding()
          .background(message.received ? Color("Peach").opacity(0.5) : Color("Lavender").opacity(0.5))
          .cornerRadius(20)
      }
      .frame(width: 300, alignment: message.received ? .leading : .trailing)
      .onTapGesture {
        showTime.toggle()
      }
      
      if showTime {
        Text("\(message.timestamp.formatted(.dateTime.hour().minute()))")
          .font(.custom("Fredoka", size: 12))
          .foregroundColor(Color("Black30"))
          .padding(message.received ? .leading : .trailing)
      }
    }
    .frame(maxWidth: .infinity, alignment: message.received ? .leading : .trailing)
    .padding(message.received ? .leading : .trailing)
    .padding(.horizontal, 10)
  }
}

struct MessageBubble_Previews: PreviewProvider {
  static var previews: some View {
    MessageBubble(message: Message(id: "asdfjf", text: "Hello, world!", received: true, timestamp: Date()))
  }
}
