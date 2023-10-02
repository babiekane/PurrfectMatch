//
//  AgeView.swift
//  PurrfectMatch
//
//  Created by CatMeox on 26/9/2566 BE.
//

import SwiftUI

struct AgeView: View {
  @State var dateSelected = Date()
  var body: some View {
    GeometryReader { geo in
      VStack(spacing: 40) {
        Text("Select your pet birthday")
          .font(.custom("Fredoka", size: 24))
          .fontWeight(.medium)
          .foregroundColor(Color("Black"))
        DatePicker("Select your pet birthday", selection: $dateSelected, displayedComponents: .date)
          .font(.custom("Fredoka", size: 20))
          .accentColor(Color("Lilac"))
          .datePickerStyle(.graphical)
          .padding()
        
        Text("Your pet age: ")
          .font(.custom("Fredoka", size: 18))
          .foregroundColor(Color("Black"))
      }
      .frame(width: geo.size.width, height: geo.size.height)
    }
  }
}

struct AgeView_Previews: PreviewProvider {
  static var previews: some View {
    AgeView()
  }
}
