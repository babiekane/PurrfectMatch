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
      VStack(spacing: 20) {
        Text("Select your pet birthday")
          .font(.custom("Fredoka", size: 24))
          .fontWeight(.medium)
          .foregroundColor(Color("Black"))
          .padding(.top, 100)
        DatePicker("Select your pet birthday", selection: $dateSelected, displayedComponents: .date)
          .font(.custom("Fredoka", size: 20))
          .accentColor(Color("Lilac"))
          .datePickerStyle(.graphical)
          .padding()
        
        Text("Your pet age: ")
          .font(.custom("Fredoka", size: 18))
          .foregroundColor(Color("Black"))
        
        Spacer()
        
        Button {
          //todo
        } label: {
          Text("Save")
            .font(.custom("Fredoka", size: 20))
            .foregroundColor(Color("White"))
            .frame(width: geo.size.width - 40, height: 50)
            .background(Color("Lilac"))
            .clipShape(Capsule())
        }
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
