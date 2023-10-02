//
//  GenderViiew.swift
//  PurrfectMatch
//
//  Created by CatMeox on 26/9/2566 BE.
//

import SwiftUI

struct GenderViiew: View {
  var body: some View {
    HStack(spacing: 12) {
      VStack {
        Button {
          //todo
        } label: {
          Image("Female")
            .resizable()
            .frame(width: 130, height: 130)
            .padding()
            .background(Color("White"))
            .cornerRadius(20)
        }
        
        Text("Female")
          .font(.custom("Fredoka", size: 18))
          .foregroundColor(Color("Black"))
      }
      
      VStack {
        Button {
          //todo
        } label: {
          Image("Male")
            .resizable()
            .frame(width: 130, height: 130)
            .padding()
            .background(Color("White"))
            .cornerRadius(20)
        }
        
        Text("Male")
          .font(.custom("Fredoka", size: 18))
          .foregroundColor(Color("Black"))
      }
    }
  }
}

struct GenderViiew_Previews: PreviewProvider {
  static var previews: some View {
    GenderViiew()
  }
}
